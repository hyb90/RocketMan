class UpcomingLaunch {
  int flightNumber;
  String missionName;
  String launchYear;
  int launchDateUnix;
  String launchDateUtc;
  String launchDateLocal;
  bool isTentative;
  String tentativeMaxPrecision;
  bool tbd;
  Rocket rocket;
  Telemetry telemetry;
  LaunchSite launchSite;
  Links links;
  bool upcoming;
  bool favorite=false;
  UpcomingLaunch(
      {this.flightNumber,
        this.missionName,
        this.launchYear,
        this.launchDateUnix,
        this.launchDateUtc,
        this.launchDateLocal,
        this.isTentative,
        this.tentativeMaxPrecision,
        this.tbd,
        this.rocket,
        this.telemetry,
        this.launchSite,
        this.links,
        this.upcoming,
});

  UpcomingLaunch.fromJson(Map<String, dynamic> json) {
    flightNumber = json['flight_number'];
    missionName = json['mission_name'];
    launchYear = json['launch_year'];
    launchDateUnix = json['launch_date_unix'];
    launchDateUtc = json['launch_date_utc'];
    launchDateLocal = json['launch_date_local'];
    isTentative = json['is_tentative'];
    tentativeMaxPrecision = json['tentative_max_precision'];
    tbd = json['tbd'];

    rocket =
    json['rocket'] != null ? new Rocket.fromJson(json['rocket']) : null;

    telemetry = json['telemetry'] != null
        ? new Telemetry.fromJson(json['telemetry'])
        : null;
    launchSite = json['launch_site'] != null
        ? new LaunchSite.fromJson(json['launch_site'])
        : null;

    upcoming = json['upcoming'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flight_number'] = this.flightNumber;
    data['mission_name'] = this.missionName;
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
    data['upcoming'] = this.upcoming;
    return data;
  }
}

class Rocket {
  String rocketId;
  String rocketName;
  String rocketType;
  FirstStage firstStage;
  SecondStage secondStage;
  Fairings fairings;

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
    fairings = json['fairings'] != null
        ? new Fairings.fromJson(json['fairings'])
        : null;
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
    if (this.fairings != null) {
      data['fairings'] = this.fairings.toJson();
    }
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
  String landingVehicle;

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
  bool reused;
  List<String> customers;
  String nationality;
  String manufacturer;
  String payloadType;
  int payloadMassKg;
  double payloadMassLbs;
  String orbit;
  OrbitParams orbitParams;

  Payloads(
      {this.payloadId,
        this.noradId,
        this.reused,
        this.customers,
        this.nationality,
        this.manufacturer,
        this.payloadType,
        this.payloadMassKg,
        this.payloadMassLbs,
        this.orbit,
        this.orbitParams});

  Payloads.fromJson(Map<String, dynamic> json) {
    payloadId = json['payload_id'];
    reused = json['reused'];
    customers = json['customers'].cast<String>();
    nationality = json['nationality'];
    manufacturer = json['manufacturer'];
    payloadType = json['payload_type'];
    payloadMassKg = json['payload_mass_kg'];
    payloadMassLbs = json['payload_mass_lbs'];
    orbit = json['orbit'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payload_id'] = this.payloadId;
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
  double lifespanYears;
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

class Fairings {
  bool reused;
  bool recoveryAttempt;
  bool recovered;
  Null ship;

  Fairings({this.reused, this.recoveryAttempt, this.recovered, this.ship});

  Fairings.fromJson(Map<String, dynamic> json) {
    reused = json['reused'];
    recoveryAttempt = json['recovery_attempt'];
    recovered = json['recovered'];
    ship = json['ship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reused'] = this.reused;
    data['recovery_attempt'] = this.recoveryAttempt;
    data['recovered'] = this.recovered;
    data['ship'] = this.ship;
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
  Null missionPatch;
  Null missionPatchSmall;
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
