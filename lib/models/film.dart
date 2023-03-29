class Film {
   String? title;
   int? episodeId;
   String? openingCrawl;
   String? director;
   String? producer;
   int? date;
   String? vehicles;

  Film({
     this.title,
     this.episodeId,
     this.openingCrawl,
     this.producer,
     this.director,
     this.date,
     this.vehicles,
  });

  Film.fromJson(Map<String, dynamic> json) {

    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    vehicles = json['vehicles'];
  }

}


