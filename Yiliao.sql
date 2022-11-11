/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022-11-11 22:11:09                          */
/*==============================================================*/


drop table if exists User;

drop table if exists feedback;

drop table if exists record;

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   UID                  int not null,
   Uname                varchar(30),
   Uphone               varchar(11),
   Upassword            varchar(30),
   Uimage               longblob,
   primary key (UID)
);

/*==============================================================*/
/* Table: feedback                                              */
/*==============================================================*/
create table feedback
(
   FID                  int not null,
   CID                  int not null,
   UID                  int not null,
   contect              varchar(200),
   picture              longblob,
   primary key (FID, UID)
);

/*==============================================================*/
/* Table: record                                                */
/*==============================================================*/
create table record
(
   CID                  int not null,
   UID                  int not null,
   Pass                 int,
   Time                 char(30),
   Vedio                varchar(60),
   Place                varchar(60),
   primary key (CID)
);

alter table feedback add constraint FK_RecordFeedback foreign key (CID)
      references record (CID) on delete restrict on update restrict;

alter table record add constraint FK_UserRecord foreign key (UID)
      references User (UID) on delete restrict on update restrict;

