dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernate.dialect.PostgreSQLDialect
    username = "root"
    password = "root"
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    //    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" 
            //dbCreate = "update" 

            //// one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
           username = "postgres"
           password = "allali"
              url = "jdbc:postgresql://localhost:5433/mnc_dev"
              //dbCreate = "create-drop"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
//    production {
//        dataSource {
//            driverClassName = "org.postgresql.Driver"
//            dialect = org.hibernate.dialect.PostgreSQLDialect
//            username = "postgres"
//           password = "motdepasse"
////            url = "jdbc:postgresql://5.196.21.199:5432/mnc"
//            url = "jdbc:postgresql://localhost:5432/mnc"
//           
////            url = "jdbc:postgresql://localhost/mnc"
//        }
//    }
production {
        dataSource {
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "mnc"
           password = "mnc"
            url = "jdbc:postgresql://localhost:5432/mnc"

        }
    }
}
