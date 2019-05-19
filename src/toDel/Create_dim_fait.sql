-- --------------------------------------------------------
--
-- Structure de la table `dim_geographie`
--

CREATE TABLE `dim_geographie` (
    `ID_GEOGRAPHIE` int(11) NOT NULL,
    `ZONE` char(35) DEFAULT NULL,
    `DIRECTION` char(35) DEFAULT NULL,
    `BU` char(35) DEFAULT NULL,
    `STADE` char(35) DEFAULT NULL,
    `SA` char(35) DEFAULT NULL,
    `SA_LIB` char(35) DEFAULT NULL,

        PRIMARY KEY(`ID_GEOGRAPHIE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_nature`
--

CREATE TABLE `dim_nature` (
    `ID_NATURE` int(11) NOT NULL,
    `CS` varchar(23) DEFAULT NULL,
    `Entite` varchar(24) DEFAULT NULL,

        PRIMARY KEY(`ID_NATURE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_rubrique`
--

CREATE TABLE `dim_rubrique` (
    `ID_RUBRIQUE` int(10) NOT NULL,
    `COMPTE` varchar(115) DEFAULT NULL,
    `COMPTE_LIB` varchar(115) DEFAULT NULL,
    `ANALYSE` varchar(55) DEFAULT NULL,
    `ANALYSE_LIB` varchar(55) DEFAULT NULL,
    `Rub1` varchar(29) DEFAULT NULL,
    `Rub2` varchar(34) DEFAULT NULL,
    `Rub3` varchar(34) DEFAULT NULL,

        PRIMARY KEY(`ID_RUBRIQUE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dim_temps`
--

CREATE TABLE `dim_temps` (
    `ID_TEMPS` int(11) NOT NULL,
    `ANNEE` int(11) DEFAULT NULL,
    `MOIS` char(25) DEFAULT NULL,
    `TRIMESTRE` char(10) DEFAULT NULL,

        PRIMARY KEY(`ID_TEMPS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Structure de la table `fait_cpc`
--

CREATE TABLE `fait_cpc` (
  `ID_GEOGRAPHIE` int(11) NOT NULL,
  `ID_RUBRIQUE` int(11) NOT NULL,
  `ID_TEMPS` int(11) NOT NULL,
  `SOLDE_DE_FIN` varchar(55) DEFAULT NULL,
  `SOLDE_DE_MOIS` double DEFAULT NULL,

        FOREIGN KEY(`ID_GEOGRAPHIE`) REFERENCES dim_geographie(`ID_GEOGRAPHIE`) ON DELETE CASCADE,
        FOREIGN KEY(`ID_RUBRIQUE`) REFERENCES dim_rubrique(`ID_RUBRIQUE`) ON DELETE CASCADE,
        FOREIGN KEY(`ID_TEMPS`) REFERENCES dim_temps(`ID_TEMPS`) ON DELETE CASCADE,

        PRIMARY KEY(`ID_GEOGRAPHIE`, `ID_RUBRIQUE`, `ID_TEMPS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fait_cs`
--

CREATE TABLE `fait_cs` (
  `ID_GEOGRAPHIE` char(10) NOT NULL,
  `ID_NATURE` char(10) NOT NULL,
  `ID_TEMPS` char(10) NOT NULL,
  `TONNE` varchar(55) DEFAULT NULL,
  `QTE_CONSO` double DEFAULT NULL,
  `MONTANT` varchar(55) DEFAULT NULL,

        FOREIGN KEY(`ID_GEOGRAPHIE`) REFERENCES dim_geographie(`ID_GEOGRAPHIE`) ON DELETE CASCADE,
        FOREIGN KEY(`ID_NATURE`) REFERENCES dim_nature(`ID_NATURE`) ON DELETE CASCADE,
        FOREIGN KEY(`ID_TEMPS`) REFERENCES dim_temps(`ID_TEMPS`) ON DELETE CASCADE,

        PRIMARY KEY(`ID_GEOGRAPHIE`, `ID_NATURE`, `ID_TEMPS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fait_tonnage`
--

CREATE TABLE `fait_tonnage` (
  `ID_GEOGRAPHIE` int(11) NOT NULL,
  `ID_TEMPS` int(11) NOT NULL,
  `TONNAGE` int(11) DEFAULT NULL,

        FOREIGN KEY(`ID_GEOGRAPHIE`) REFERENCES dim_geographie(`ID_GEOGRAPHIE`) ON DELETE CASCADE,
        FOREIGN KEY(`ID_TEMPS`) REFERENCES dim_temps(`ID_TEMPS`) ON DELETE CASCADE,

        PRIMARY KEY(`ID_GEOGRAPHIE`, `ID_TEMPS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
