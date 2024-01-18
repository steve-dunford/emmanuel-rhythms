

// See https://aka.ms/new-console-template for more information
using System.Globalization;
using CsvHelper;
using Google.Cloud.Firestore;
using Google.GData.Client;
using Google.GData.Extensions;
using Google.GData.Spreadsheets;

var project = "emmanuel-rhythms-production";

await ImportDevotionals();

async Task ImportDevotionals()
{
    //Read CSV
    using (var reader = new StreamReader("devotionals.csv"))
    using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
    {
        var devotionals = csv.GetRecords<dynamic>();

        var db = FirestoreDb.Create(project);
        var dailyContent = db.Collection("daily_content");
        var instances = db.Collection("daily_content_instances");


        foreach (var devotional in devotionals)
        {
            var day = int.Parse(devotional.day);

            if (day <= 32)
            {
                continue;
            }

            Console.WriteLine("Processing devotional " + day);
            
            var date = new DateTime(2024, 1, 1, 0,0,0,DateTimeKind.Utc).AddDays(day - 1);

            var dcId = Guid.NewGuid().ToString();
            var dcInstanceId = Guid.NewGuid().ToString();
            var itemId = Guid.NewGuid().ToString();


            var item = new
            {
                id = itemId,
                isPriority = false,
                backgroundImage = "https://firebasestorage.googleapis.com/v0/b/emmanuel-rhythms-production.appspot.com/o/item_images%2F0531c04e-d3d1-4b6b-a21d-161ba5c8c975.jpg?alt=media&token=80fdae5e-a82f-4017-ae40-ce5fc2e7845e",
                sortOrder = 1,
                churches = new string[]
                {
                    "emmanuelLurgan",
                    "emmanuelPortadown"
                },
                scriptureReferences = new[]
                {
                    new
                    {
                        id = Guid.NewGuid().ToString(),
                        book = devotional.book,
                        fromChapter = devotional.chapterFrom != String.Empty ? int.Parse(devotional.chapterFrom) : null,
                        toChapter = devotional.chapterTo != String.Empty ? int.Parse(devotional.chapterTo) : null
                    }
                },
                title = "Bible Reading Plan",
                type = "devotional",
                tags = new string[] { }
            };

            await dailyContent
                .Document(dcId)
                .CreateAsync(new
                {
                    dailyContentId = dcId,
                    startDate = Timestamp.FromDateTime(date),
                    endDate = Timestamp.FromDateTime(date),
                    scheduleType = "oneDay",
                    item = item
                });

            await instances
                .Document(dcInstanceId)
                .CreateAsync(new
                {
                    dailyContentId = dcId,
                    dailyContentInstanceId = dcInstanceId,
                    date = Timestamp.FromDateTime(date),
                    item = item
                });

        }
    }

}
