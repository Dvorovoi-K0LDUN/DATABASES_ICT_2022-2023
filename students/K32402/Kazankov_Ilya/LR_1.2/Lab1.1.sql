PGDMP                          {            Lab1    15.3    15.3 <    P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    16398    Lab1    DATABASE     �   CREATE DATABASE "Lab1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1251';
    DROP DATABASE "Lab1";
                postgres    false                        2615    16720    Lab1    SCHEMA        CREATE SCHEMA "Lab1";
    DROP SCHEMA "Lab1";
                postgres    false            �            1259    17327    cash_register    TABLE     �   CREATE TABLE public.cash_register (
    number_cash_register integer NOT NULL,
    locality character varying(40) NOT NULL,
    address_cash_desks character varying(40) NOT NULL
);
 !   DROP TABLE public.cash_register;
       public         heap    postgres    false            �            1259    17326 &   cash_register_number_cash_register_seq    SEQUENCE     �   ALTER TABLE public.cash_register ALTER COLUMN number_cash_register ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cash_register_number_cash_register_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    17321 	   passenger    TABLE     �   CREATE TABLE public.passenger (
    passenger_id integer NOT NULL,
    passport character varying(10) NOT NULL,
    full_name character varying(40) NOT NULL
);
    DROP TABLE public.passenger;
       public         heap    postgres    false            �            1259    17320    passenger_passenger_id_seq    SEQUENCE     �   ALTER TABLE public.passenger ALTER COLUMN passenger_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.passenger_passenger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    17271    place    TABLE     �   CREATE TABLE public.place (
    number_place integer NOT NULL,
    number_railway_carriage integer,
    location_type character varying(20)
);
    DROP TABLE public.place;
       public         heap    postgres    false            �            1259    17270    place_number_place_seq    SEQUENCE     �   ALTER TABLE public.place ALTER COLUMN number_place ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.place_number_place_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    17260    railway_carriage    TABLE     �   CREATE TABLE public.railway_carriage (
    number_railway_carriage integer NOT NULL,
    number_train integer,
    railway_carriage_type character varying(40),
    number_of_seats integer,
    railway_carriage_number_in_train integer
);
 $   DROP TABLE public.railway_carriage;
       public         heap    postgres    false            �            1259    17259 ,   railway_carriage_number_railway_carriage_seq    SEQUENCE       ALTER TABLE public.railway_carriage ALTER COLUMN number_railway_carriage ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.railway_carriage_number_railway_carriage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    17282    schedule    TABLE     �  CREATE TABLE public.schedule (
    schedule_id integer NOT NULL,
    number_train integer,
    paragraph_departures character varying(40),
    paragraph_destination character varying(40),
    date_and_time_sent date NOT NULL,
    date_and_time_transformation date NOT NULL,
    status_trains character(20) NOT NULL,
    CONSTRAINT schedule_check CHECK ((date_and_time_sent <= date_and_time_transformation))
);
    DROP TABLE public.schedule;
       public         heap    postgres    false            �            1259    17281    schedule_schedule_id_seq    SEQUENCE     �   ALTER TABLE public.schedule ALTER COLUMN schedule_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.schedule_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17294    station    TABLE     �   CREATE TABLE public.station (
    number_station integer NOT NULL,
    name_station character varying(40),
    paragraph_destination character varying(40)
);
    DROP TABLE public.station;
       public         heap    postgres    false            �            1259    17293    station_number_station_seq    SEQUENCE     �   ALTER TABLE public.station ALTER COLUMN number_station ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.station_number_station_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17300    stop    TABLE     $  CREATE TABLE public.stop (
    number_stop integer NOT NULL,
    schedule_id integer,
    number_train integer,
    number_station integer,
    type_locality character varying(20),
    duration_stop time without time zone,
    date_arrival date NOT NULL,
    date_departures date NOT NULL
);
    DROP TABLE public.stop;
       public         heap    postgres    false            �            1259    17299    stop_number_stop_seq    SEQUENCE     �   ALTER TABLE public.stop ALTER COLUMN number_stop ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.stop_number_stop_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    17333    ticket    TABLE     z  CREATE TABLE public.ticket (
    number_of_ticket integer NOT NULL,
    number_place integer,
    number_cash_register integer,
    passenger_id integer,
    number_station integer,
    paragraph_departures character varying(40),
    price_ticket integer NOT NULL,
    way_payment character varying(20),
    date_purchases date NOT NULL,
    date_and_time_sent date NOT NULL,
    date_and_time_transformation date NOT NULL,
    paragraph_destination character varying(40),
    CONSTRAINT ticket_check CHECK ((date_and_time_sent <= date_and_time_transformation)),
    CONSTRAINT ticket_price_ticket_check CHECK ((price_ticket > 0))
);
    DROP TABLE public.ticket;
       public         heap    postgres    false            �            1259    17332    ticket_number_of_ticket_seq    SEQUENCE     �   ALTER TABLE public.ticket ALTER COLUMN number_of_ticket ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ticket_number_of_ticket_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    17253    train    TABLE     ~  CREATE TABLE public.train (
    number_train integer NOT NULL,
    name_train character varying(40) NOT NULL,
    flight_type character varying(20) NOT NULL,
    train_type character varying(20) NOT NULL,
    date_and_time_sent date NOT NULL,
    date_and_time_transformation date NOT NULL,
    CONSTRAINT train_check CHECK ((date_and_time_sent <= date_and_time_transformation))
);
    DROP TABLE public.train;
       public         heap    postgres    false            �            1259    17252    train_number_train_seq    SEQUENCE     �   ALTER TABLE public.train ALTER COLUMN number_train ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.train_number_train_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            K          0    17327    cash_register 
   TABLE DATA           [   COPY public.cash_register (number_cash_register, locality, address_cash_desks) FROM stdin;
    public          postgres    false    230   �N       I          0    17321 	   passenger 
   TABLE DATA           F   COPY public.passenger (passenger_id, passport, full_name) FROM stdin;
    public          postgres    false    228   �N       A          0    17271    place 
   TABLE DATA           U   COPY public.place (number_place, number_railway_carriage, location_type) FROM stdin;
    public          postgres    false    220   �N       ?          0    17260    railway_carriage 
   TABLE DATA           �   COPY public.railway_carriage (number_railway_carriage, number_train, railway_carriage_type, number_of_seats, railway_carriage_number_in_train) FROM stdin;
    public          postgres    false    218   �N       C          0    17282    schedule 
   TABLE DATA           �   COPY public.schedule (schedule_id, number_train, paragraph_departures, paragraph_destination, date_and_time_sent, date_and_time_transformation, status_trains) FROM stdin;
    public          postgres    false    222   O       E          0    17294    station 
   TABLE DATA           V   COPY public.station (number_station, name_station, paragraph_destination) FROM stdin;
    public          postgres    false    224   .O       G          0    17300    stop 
   TABLE DATA           �   COPY public.stop (number_stop, schedule_id, number_train, number_station, type_locality, duration_stop, date_arrival, date_departures) FROM stdin;
    public          postgres    false    226   KO       M          0    17333    ticket 
   TABLE DATA           �   COPY public.ticket (number_of_ticket, number_place, number_cash_register, passenger_id, number_station, paragraph_departures, price_ticket, way_payment, date_purchases, date_and_time_sent, date_and_time_transformation, paragraph_destination) FROM stdin;
    public          postgres    false    232   hO       =          0    17253    train 
   TABLE DATA           �   COPY public.train (number_train, name_train, flight_type, train_type, date_and_time_sent, date_and_time_transformation) FROM stdin;
    public          postgres    false    216   �O       T           0    0 &   cash_register_number_cash_register_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.cash_register_number_cash_register_seq', 1, false);
          public          postgres    false    229            U           0    0    passenger_passenger_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.passenger_passenger_id_seq', 1, false);
          public          postgres    false    227            V           0    0    place_number_place_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.place_number_place_seq', 1, false);
          public          postgres    false    219            W           0    0 ,   railway_carriage_number_railway_carriage_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.railway_carriage_number_railway_carriage_seq', 1, false);
          public          postgres    false    217            X           0    0    schedule_schedule_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.schedule_schedule_id_seq', 1, false);
          public          postgres    false    221            Y           0    0    station_number_station_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.station_number_station_seq', 1, false);
          public          postgres    false    223            Z           0    0    stop_number_stop_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.stop_number_stop_seq', 1, false);
          public          postgres    false    225            [           0    0    ticket_number_of_ticket_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ticket_number_of_ticket_seq', 1, false);
          public          postgres    false    231            \           0    0    train_number_train_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.train_number_train_seq', 1, false);
          public          postgres    false    215            �           2606    17331     cash_register cash_register_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.cash_register
    ADD CONSTRAINT cash_register_pkey PRIMARY KEY (number_cash_register);
 J   ALTER TABLE ONLY public.cash_register DROP CONSTRAINT cash_register_pkey;
       public            postgres    false    230            �           2606    17325    passenger passenger_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (passenger_id);
 B   ALTER TABLE ONLY public.passenger DROP CONSTRAINT passenger_pkey;
       public            postgres    false    228            �           2606    17275    place place_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (number_place);
 :   ALTER TABLE ONLY public.place DROP CONSTRAINT place_pkey;
       public            postgres    false    220            �           2606    17264 &   railway_carriage railway_carriage_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.railway_carriage
    ADD CONSTRAINT railway_carriage_pkey PRIMARY KEY (number_railway_carriage);
 P   ALTER TABLE ONLY public.railway_carriage DROP CONSTRAINT railway_carriage_pkey;
       public            postgres    false    218            �           2606    17287    schedule schedule_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id);
 @   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_pkey;
       public            postgres    false    222            �           2606    17298    station station_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (number_station);
 >   ALTER TABLE ONLY public.station DROP CONSTRAINT station_pkey;
       public            postgres    false    224            �           2606    17304    stop stop_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.stop
    ADD CONSTRAINT stop_pkey PRIMARY KEY (number_stop);
 8   ALTER TABLE ONLY public.stop DROP CONSTRAINT stop_pkey;
       public            postgres    false    226            �           2606    17339    ticket ticket_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (number_of_ticket);
 <   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_pkey;
       public            postgres    false    232            �           2606    17258    train train_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.train
    ADD CONSTRAINT train_pkey PRIMARY KEY (number_train);
 :   ALTER TABLE ONLY public.train DROP CONSTRAINT train_pkey;
       public            postgres    false    216            �           2606    17276 (   place place_number_railway_carriage_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.place
    ADD CONSTRAINT place_number_railway_carriage_fkey FOREIGN KEY (number_railway_carriage) REFERENCES public.railway_carriage(number_railway_carriage);
 R   ALTER TABLE ONLY public.place DROP CONSTRAINT place_number_railway_carriage_fkey;
       public          postgres    false    218    220    3221            �           2606    17265 3   railway_carriage railway_carriage_number_train_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.railway_carriage
    ADD CONSTRAINT railway_carriage_number_train_fkey FOREIGN KEY (number_train) REFERENCES public.train(number_train);
 ]   ALTER TABLE ONLY public.railway_carriage DROP CONSTRAINT railway_carriage_number_train_fkey;
       public          postgres    false    218    3219    216            �           2606    17288 #   schedule schedule_number_train_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_number_train_fkey FOREIGN KEY (number_train) REFERENCES public.train(number_train);
 M   ALTER TABLE ONLY public.schedule DROP CONSTRAINT schedule_number_train_fkey;
       public          postgres    false    3219    216    222            �           2606    17315    stop stop_number_station_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stop
    ADD CONSTRAINT stop_number_station_fkey FOREIGN KEY (number_station) REFERENCES public.station(number_station);
 G   ALTER TABLE ONLY public.stop DROP CONSTRAINT stop_number_station_fkey;
       public          postgres    false    226    3227    224            �           2606    17310    stop stop_number_train_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stop
    ADD CONSTRAINT stop_number_train_fkey FOREIGN KEY (number_train) REFERENCES public.train(number_train);
 E   ALTER TABLE ONLY public.stop DROP CONSTRAINT stop_number_train_fkey;
       public          postgres    false    216    3219    226            �           2606    17305    stop stop_schedule_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.stop
    ADD CONSTRAINT stop_schedule_id_fkey FOREIGN KEY (schedule_id) REFERENCES public.schedule(schedule_id);
 D   ALTER TABLE ONLY public.stop DROP CONSTRAINT stop_schedule_id_fkey;
       public          postgres    false    226    3225    222            �           2606    17345 '   ticket ticket_number_cash_register_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_number_cash_register_fkey FOREIGN KEY (number_cash_register) REFERENCES public.cash_register(number_cash_register);
 Q   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_number_cash_register_fkey;
       public          postgres    false    232    230    3233            �           2606    17340    ticket ticket_number_place_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_number_place_fkey FOREIGN KEY (number_place) REFERENCES public.place(number_place);
 I   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_number_place_fkey;
       public          postgres    false    3223    232    220            �           2606    17355 !   ticket ticket_number_station_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_number_station_fkey FOREIGN KEY (number_station) REFERENCES public.station(number_station);
 K   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_number_station_fkey;
       public          postgres    false    3227    232    224            �           2606    17350    ticket ticket_passenger_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_passenger_id_fkey FOREIGN KEY (passenger_id) REFERENCES public.passenger(passenger_id);
 I   ALTER TABLE ONLY public.ticket DROP CONSTRAINT ticket_passenger_id_fkey;
       public          postgres    false    3231    232    228            K      x������ � �      I      x������ � �      A      x������ � �      ?      x������ � �      C      x������ � �      E      x������ � �      G      x������ � �      M      x������ � �      =      x������ � �     