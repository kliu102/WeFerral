Heron::Role.where(:name => "admin").first_or_create
Heron::Role.where(:name => "user").first_or_create
