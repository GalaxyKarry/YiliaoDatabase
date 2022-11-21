/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022-11-21 11:03:15                          */
/*==============================================================*/


drop table if exists CarouselChart;

drop table if exists Feedback;

drop table if exists LargeComponents;

drop table if exists Record;

drop table if exists User;

drop table if exists Widgets;

/*==============================================================*/
/* Table: CarouselChart                                         */
/*==============================================================*/
create table CarouselChart
(
   CarId                int not null,
   CarImage             longblob,
   COrder               int,
   primary key (CarId)
);

/*==============================================================*/
/* Table: Feedback                                              */
/*==============================================================*/
create table Feedback
(
   FID                  int not null,
   CID                  int not null,
   UID                  int not null,
   Contect              varchar(200),
   Picture              longblob,
   primary key (FID, UID)
);

/*==============================================================*/
/* Table: LargeComponents                                       */
/*==============================================================*/
create table LargeComponents
(
   LcId                 int not null,
   LcContent            varchar(10),
   primary key (LcId)
);

/*==============================================================*/
/* Table: Record                                                */
/*==============================================================*/
create table Record
(
   CID                  int not null,
   UID                  int not null,
   Pass                 int,
   Time                 char(30),
   Place                varchar(60),
   Proposal             varchar(60),
   Vedio1               varchar(60),
   Vedio2               varchar(60),
   Vedio3               varchar(60),
   primary key (CID)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   UID                  int not null,
   Uame                 varchar(30),
   UPhone               varchar(11),
   UPassword            varchar(30),
   UPmage               longblob,
   primary key (UID)
);

/*==============================================================*/
/* Table: Widgets                                               */
/*==============================================================*/
create table Widgets
(
   WId                  int not null,
   LcId                 int not null,
   Subtitle             varchar(20),
   WContent             varchar(60),
   WImage               longblob,
   primary key (WId)
);

alter table Feedback add constraint FK_RecordFeedback foreign key (CID)
      references Record (CID) on delete restrict on update restrict;

alter table Record add constraint FK_UserRecord foreign key (UID)
      references User (UID) on delete restrict on update restrict;

alter table Widgets add constraint FK_Contain foreign key (LcId)
      references LargeComponents (LcId) on delete restrict on update restrict;

