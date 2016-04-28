##Multi-tenancy

###Tenant
A tenant is any **application** -- either inside or outside the enterprise -- that needs its **own secure and exclusive virtual computing environment**.

###Degrees of multi-tenancy
* The exact degree of multi-tenancy, as it's commonly defined, is based on how much of the core application, or SaaS, layer is designed to be shared across tenants.
* **Highest degree**: IaaS and PaaS are multi-tenant. SaaS is fully multi-tenant also.
* **Middle degree**: IaaS and PaaS are multi-tenant. Small SaaS clusters are multi-tenant.
* **Lowest degree**: IaaS and PaaS are multi-tenant. SaaS is single tenant.

* For example, Salesforce.com, at the relatively high end of the multi-tenancy spectrum, has 72,500 customers who are supported by 8 to 12 multi-tenant instances (meaning IaaS/PaaS instances) in a 1:5000 ratio. In other words, each multi-tenant instance supports 5,000 tenants who share the same database schema.