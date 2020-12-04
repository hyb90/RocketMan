class NextLaunch {
  int flightNumber;
  String missionName;
  List<String> missionId;
  String launchYear;
  int launchDateUnix;
  String launchDateUtc;
  String launchDateLocal;
  bool isTentative;
  String tentativeMaxPrecision;
  bool tbd;
  Rocket rocket;
  List<Null> ships;
  Telemetry telemetry;
  LaunchSite launchSite;
  Links links;
  String details;
  bool upcoming;
  String lastDateUpdate;
  String lastWikiLaunchDate;
  String lastWikiRevision;
  String lastWikiUpdate;
  String launchDateSource;

  NextLaunch(
      {this.flightNumber,
        this.missionName,
        this.missionId,
        this.launchYear,
        this.launchDateUnix,
        this.launchDateUtc,
        this.launchDateLocal,
        this.isTentative,
        this.tentativeMaxPrecision,
        this.tbd,
        this.rocket,
        this.ships,
        this.telemetry,
        this.launchSite,
        this.links,
        this.details,
        this.upcoming,
        this.lastDateUpdate,
        this.lastWikiLaunchDate,
        this.lastWikiRevision,
        this.lastWikiUpdate,
        this.launchDateSource});

  NextLaunch.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    missionName = json['mission_name'];
    missionId = json['mission_id'].cast<String>();
    launchYear = json['launch_year'];
    launchDateUnix = json['launch_date_unix'];
    launchDateUtc = json['launch_date_utc'];
    launchDateLocal = json['launch_date_local'];
    isTentative = json['is_tentative'];
    tentativeMaxPrecision = json['tentative_max_precision'];
    tbd = json['tbd'];
    telemetry = json['telemetry'] != null
        ? new Telemetry.fromJson(json['telemetry'])
        : null;
    launchSite = json['launch_site'] != null
        ? new LaunchSite.fromJson(json['launch_site'])
        : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    details = json['details'];
    upcoming = json['upcoming'];
    lastDateUpdate = json['last_date_update'];
    lastWikiLaunchDate = json['last_wiki_launch_date'];
    lastWikiRevision = json['last_wiki_revision'];
    lastWikiUpdate = json['last_wiki_update'];
    launchDateSource = json['launch_date_source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['mission_name'] = this.missionName;
    data['mission_id'] = this.missionId;
    data['launch_year'] = this.launchYear;
    data['launch_date_unix'] = this.launchDateUnix;
    data['launch_date_utc'] = this.launchDateUtc;
    data['launch_date_local'] = this.launchDateLocal;
    data['is_tentative'] = this.isTentative;
    data['tentative_max_precision'] = this.tentativeMaxPrecision;
    data['tbd'] = this.tbd;

    if (this.rocket != null) {
      data['rocket'] = this.rocket.toJson();
    }
    if (this.telemetry != null) {
      data['telemetry'] = this.telemetry.toJson();
    }
    if (this.launchSite != null) {
      data['launch_site'] = this.launchSite.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    data['details'] = this.details;
    data['upcoming'] = this.upcoming;
    data['last_date_update'] = this.lastDateUpdate;
    data['last_wiki_launch_date'] = this.lastWikiLaunchDate;
    data['last_wiki_revision'] = this.lastWikiRevision;
    data['last_wiki_update'] = this.lastWikiUpdate;
    data['launch_date_source'] = this.launchDateSource;
    return data;
  }
}

class Rocket {
  String rocketId;
  String rocketName;
  String rocketType;
  FirstStage firstStage;
  SecondStage secondStage;
  Null fairings;

  Rocket(
      {this.rocketId,
        this.rocketName,
        this.rocketType,
        this.firstStage,
        this.secondStage,
        this.fairings});

  Rocket.fromJson(Map<String, dynamic> json) {
    rocketId = json['rocket_id'];
    rocketName = json['rocket_name'];
    rocketType = json['rocket_type'];
    firstStage = json['first_stage'] != null
        ? new FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? new SecondStage.fromJson(json['second_stage'])
        : null;
    fairings = json['fairings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rocket_id'] = this.rocketId;
    data['rocket_name'] = this.rocketName;
    data['rocket_type'] = this.rocketType;
    if (this.firstStage != null) {
      data['first_stage'] = this.firstStage.toJson();
    }
    if (this.secondStage != null) {
      data['second_stage'] = this.secondStage.toJson();
    }
    data['fairings'] = this.fairings;
    return data;
  }
}

class FirstStage {
  List<Cores> cores;

  FirstStage({this.cores});

  FirstStage.fromJson(Map<String, dynamic> json) {
    if (json['cores'] != null) {
      cores = new List<Cores>();
      json['cores'].forEach((v) {
        cores.add(new Cores.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cores != null) {
      data['cores'] = this.cores.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cores {
  String coreSerial;
  int flight;
  int block;
  bool gridfins;
  bool legs;
  bool reused;
  Null landSuccess;
  bool landingIntent;
  String landingType;
  Null landingVehicle;

  Cores(
      {this.coreSerial,
        this.flight,
        this.block,
        this.gridfins,
        this.legs,
        this.reused,
        this.landSuccess,
        this.landingIntent,
        this.landingType,
        this.landingVehicle});

  Cores.fromJson(Map<String, dynamic> json) {
    coreSerial = json['core_serial'];
    flight = json['flight'];
    block = json['block'];
    gridfins = json['gridfins'];
    legs = json['legs'];
    reused = json['reused'];
    landSuccess = json['land_success'];
    landingIntent = json['landing_intent'];
    landingType = json['landing_type'];
    landingVehicle = json['landing_vehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['core_serial'] = this.coreSerial;
    data['flight'] = this.flight;
    data['block'] = this.block;
    data['gridfins'] = this.gridfins;
    data['legs'] = this.legs;
    data['reused'] = this.reused;
    data['land_success'] = this.landSuccess;
    data['landing_intent'] = this.landingIntent;
    data['landing_type'] = this.landingType;
    data['landing_vehicle'] = this.landingVehicle;
    return data;
  }
}

class SecondStage {
  int block;
  List<Payloads> payloads;

  SecondStage({this.block, this.payloads});

  SecondStage.fromJson(Map<String, dynamic> json) {
    block = json['block'];
    if (json['payloads'] != null) {
      payloads = new List<Payloads>();
      json['payloads'].forEach((v) {
        payloads.add(new Payloads.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block'] = this.block;
    if (this.payloads != null) {
      data['payloads'] = this.payloads.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payloads {
  String payloadId;
  List<Null> noradId;
  String capSerial;
  bool reused;
  List<String> customers;
  String nationality;
  String manufacturer;
  String payloadType;
  Null payloadMassKg;
  Null payloadMassLbs;
  String orbit;
  OrbitParams orbitParams;
  Null massReturnedKg;
  Null massReturnedLbs;
  Null flightTimeSec;
  Null cargoManifest;

  Payloads(
      {this.payloadId,
        this.noradId,
        this.capSerial,
        this.reused,
        this.customers,
        this.nationality,
        this.manufacturer,
        this.payloadType,
        this.payloadMassKg,
        this.payloadMassLbs,
        this.orbit,
        this.orbitParams,
        this.massReturnedKg,
        this.massReturnedLbs,
        this.flightTimeSec,
        this.cargoManifest});

  Payloads.fromJson(Map<String, dynamic> json) {
    payloadId = json['payload_id'];
    capSerial = json['cap_serial'];
    reused = json['reused'];
    customers = json['customers'].cast<String>();
    nationality = json['nationality'];
    manufacturer = json['manufacturer'];
    payloadType = json['payload_type'];
    payloadMassKg = json['payload_mass_kg'];
    payloadMassLbs = json['payload_mass_lbs'];
    orbit = json['orbit'];
    orbitParams = json['orbit_params'] != null
        ? new OrbitParams.fromJson(json['orbit_params'])
        : null;
    massReturnedKg = json['mass_returned_kg'];
    massReturnedLbs = json['mass_returned_lbs'];
    flightTimeSec = json['flight_time_sec'];
    cargoManifest = json['cargo_manifest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payload_id'] = this.payloadId;
    data['cap_serial'] = this.capSerial;
    data['reused'] = this.reused;
    data['customers'] = this.customers;
    data['nationality'] = this.nationality;
    data['manufacturer'] = this.manufacturer;
    data['payload_type'] = this.payloadType;
    data['payload_mass_kg'] = this.payloadMassKg;
    data['payload_mass_lbs'] = this.payloadMassLbs;
    data['orbit'] = this.orbit;
    if (this.orbitParams != null) {
      data['orbit_params'] = this.orbitParams.toJson();
    }
    data['mass_returned_kg'] = this.massReturnedKg;
    data['mass_returned_lbs'] = this.massReturnedLbs;
    data['flight_time_sec'] = this.flightTimeSec;
    data['cargo_manifest'] = this.cargoManifest;
    return data;
  }
}

class OrbitParams {
  String referenceSystem;
  String regime;
  Null longitude;
  Null semiMajorAxisKm;
  Null eccentricity;
  Null periapsisKm;
  Null apoapsisKm;
  Null inclinationDeg;
  Null periodMin;
  Null lifespanYears;
  Null epoch;
  Null meanMotion;
  Null raan;
  Null argOfPericenter;
  Null meanAnomaly;

  OrbitParams(
      {this.referenceSystem,
        this.regime,
        this.longitude,
        this.semiMajorAxisKm,
        this.eccentricity,
        this.periapsisKm,
        this.apoapsisKm,
        this.inclinationDeg,
        this.periodMin,
        this.lifespanYears,
        this.epoch,
        this.meanMotion,
        this.raan,
        this.argOfPericenter,
        this.meanAnomaly});

  OrbitParams.fromJson(Map<String, dynamic> json) {
    referenceSystem = json['reference_system'];
    regime = json['regime'];
    longitude = json['longitude'];
    semiMajorAxisKm = json['semi_major_axis_km'];
    eccentricity = json['eccentricity'];
    periapsisKm = json['periapsis_km'];
    apoapsisKm = json['apoapsis_km'];
    inclinationDeg = json['inclination_deg'];
    periodMin = json['period_min'];
    lifespanYears = json['lifespan_years'];
    epoch = json['epoch'];
    meanMotion = json['mean_motion'];
    raan = json['raan'];
    argOfPericenter = json['arg_of_pericenter'];
    meanAnomaly = json['mean_anomaly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_system'] = this.referenceSystem;
    data['regime'] = this.regime;
    data['longitude'] = this.longitude;
    data['semi_major_axis_km'] = this.semiMajorAxisKm;
    data['eccentricity'] = this.eccentricity;
    data['periapsis_km'] = this.periapsisKm;
    data['apoapsis_km'] = this.apoapsisKm;
    data['inclination_deg'] = this.inclinationDeg;
    data['period_min'] = this.periodMin;
    data['lifespan_years'] = this.lifespanYears;
    data['epoch'] = this.epoch;
    data['mean_motion'] = this.meanMotion;
    data['raan'] = this.raan;
    data['arg_of_pericenter'] = this.argOfPericenter;
    data['mean_anomaly'] = this.meanAnomaly;
    return data;
  }
}

class Telemetry {
  Null flightClub;

  Telemetry({this.flightClub});

  Telemetry.fromJson(Map<String, dynamic> json) {
    flightClub = json['flight_club'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_club'] = this.flightClub;
    return data;
  }
}

class LaunchSite {
  String siteId;
  String siteName;
  String siteNameLong;

  LaunchSite({this.siteId, this.siteName, this.siteNameLong});

  LaunchSite.fromJson(Map<String, dynamic> json) {
    siteId = json['site_id'];
    siteName = json['site_name'];
    siteNameLong = json['site_name_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['site_id'] = this.siteId;
    data['site_name'] = this.siteName;
    data['site_name_long'] = this.siteNameLong;
    return data;
  }
}

class Links {
  String missionPatch;
  String missionPatchSmall;
  String redditCampaign;
  Null redditLaunch;
  Null redditRecovery;
  Null redditMedia;
  Null presskit;
  Null articleLink;
  Null wikipedia;
  Null videoLink;
  Null youtubeId;
  List<Null> flickrImages;

  Links(
      {this.missionPatch,
        this.missionPatchSmall,
        this.redditCampaign,
        this.redditLaunch,
        this.redditRecovery,
        this.redditMedia,
        this.presskit,
        this.articleLink,
        this.wikipedia,
        this.videoLink,
        this.youtubeId,
        this.flickrImages});

  Links.fromJson(Map<String, dynamic> json) {
    missionPatch = json['mission_patch'];
    missionPatchSmall = json['mission_patch_small'];
    redditCampaign = json['reddit_campaign'];
    redditLaunch = json['reddit_launch'];
    redditRecovery = json['reddit_recovery'];
    redditMedia = json['reddit_media'];
    presskit = json['presskit'];
    articleLink = json['article_link'];
    wikipedia = json['wikipedia'];
    videoLink = json['video_link'];
    youtubeId = json['youtube_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mission_patch'] = this.missionPatch;
    data['mission_patch_small'] = this.missionPatchSmall;
    data['reddit_campaign'] = this.redditCampaign;
    data['reddit_launch'] = this.redditLaunch;
    data['reddit_recovery'] = this.redditRecovery;
    data['reddit_media'] = this.redditMedia;
    data['presskit'] = this.presskit;
    data['article_link'] = this.articleLink;
    data['wikipedia'] = this.wikipedia;
    data['video_link'] = this.videoLink;
    data['youtube_id'] = this.youtubeId;
    return data;
  }
}
