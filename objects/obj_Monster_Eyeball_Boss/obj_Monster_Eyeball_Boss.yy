{
  "spriteId": {
    "name": "spr_Boss_Eyes",
    "path": "sprites/spr_Boss_Eyes/spr_Boss_Eyes.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_Monster_Parent",
    "path": "objects/obj_Monster_Parent/obj_Monster_Parent.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"hp_max","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"objectId":{"name":"obj_Monster_Parent","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"value":"10+ (global.rooms_completed)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"damage","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"objectId":{"name":"obj_Monster_Parent","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"value":"irandom(6+ (3 * global.rooms_completed))","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"reward","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"objectId":{"name":"obj_Monster_Parent","path":"objects/obj_Monster_Parent/obj_Monster_Parent.yy",},"value":"40","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Monsters",
    "path": "folders/Objects/Monsters.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_Monster_Eyeball_Boss",
  "tags": [],
  "resourceType": "GMObject",
}