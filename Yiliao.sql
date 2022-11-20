/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2022-11-20 22:25:35                          */
/*==============================================================*/


drop table if exists Carousel_chart;

drop table if exists Large_components;

drop table if exists Tips;

drop table if exists User;

drop table if exists Widgets;

drop table if exists feedback;

drop table if exists record;

/*==============================================================*/
/* Table: Carousel_chart                                        */
/*==============================================================*/
create table Carousel_chart
(
   CarId                int not null,
   CarImage             longblob,
   primary key (CarId)
);

/*==============================================================*/
/* Table: Large_components                                      */
/*==============================================================*/
create table Large_components
(
   LcId                 int not null,
   LcContent            varchar(10),
   primary key (LcId)
);

/*==============================================================*/
/* Table: Tips                                                  */
/*==============================================================*/
create table Tips
(
   Tip                  varchar(30) not null,
   primary key (Tip)
);

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
   Proposal             varchar(60),
   primary key (CID)
);

alter table Widgets add constraint FK_Contain foreign key (LcId)
      references Large_components (LcId) on delete restrict on update restrict;

alter table feedback add constraint FK_RecordFeedback foreign key (CID)
      references record (CID) on delete restrict on update restrict;

alter table record add constraint FK_UserRecord foreign key (UID)
      references User (UID) on delete restrict on update restrict;

