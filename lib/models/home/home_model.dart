class HomeModel {
  HomeModel({
    this.devices,
    this.simcard,
    this.drivers,
    this.transmission,
  });

  Devices? devices;
  Simcard? simcard;
  Drivers? drivers;
  Transmission? transmission;

  factory HomeModel.fromMap(Map<String, dynamic> json) => HomeModel(
        devices: Devices.fromMap(json["devices"]),
        simcard: Simcard.fromMap(json["simcard"]),
        drivers: Drivers.fromMap(json["drivers"]),
        transmission: Transmission.fromMap(json["transmission"]),
      );

  Map<String, dynamic> toMap() => {
        "devices": devices!.toMap(),
        "simcard": simcard!.toMap(),
        "drivers": drivers!.toMap(),
        "transmission": transmission!.toMap(),
      };
}

class Devices {
  Devices({
    this.count,
    this.active,
    this.inactive,
  });

  int? count;
  int? active;
  int? inactive;

  factory Devices.fromMap(Map<String, dynamic> json) => Devices(
        count: json["count"],
        active: json["active"],
        inactive: json["inactive"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "active": active,
        "inactive": inactive,
      };
}

class Drivers {
  Drivers({
    this.count,
    this.expireToday,
    this.expired,
    this.expiredInSevenDays,
    this.expiredInThirtyDays,
  });

  int? count;
  int? expireToday;
  int? expired;
  int? expiredInSevenDays;
  int? expiredInThirtyDays;

  factory Drivers.fromMap(Map<String, dynamic> json) => Drivers(
        count: json["count"],
        expireToday: json["expire_today"],
        expired: json["expired"],
        expiredInSevenDays: json["expired_in_seven_days"],
        expiredInThirtyDays: json["expired_in_thirty_days"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "expire_today": expireToday,
        "expired": expired,
        "expired_in_seven_days": expiredInSevenDays,
        "expired_in_thirty_days": expiredInThirtyDays,
      };
}

class Simcard {
  Simcard({
    this.count,
    this.active,
    this.unlinked,
  });

  int? count;
  int? active;
  int? unlinked;

  factory Simcard.fromMap(Map<String, dynamic> json) => Simcard(
        count: json["count"],
        active: json["active"],
        unlinked: json["unlinked"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "active": active,
        "unlinked": unlinked,
      };
}

class Transmission {
  Transmission({
    this.green,
    this.yellow,
    this.orange,
    this.red,
  });

  int? green;
  int? yellow;
  int? orange;
  int? red;

  factory Transmission.fromMap(Map<String, dynamic> json) => Transmission(
        green: json["green"],
        yellow: json["yellow"],
        orange: json["orange"],
        red: json["red"],
      );

  Map<String, dynamic> toMap() => {
        "green": green,
        "yellow": yellow,
        "orange": orange,
        "red": red,
      };
}
