OWCC-Deployment-Scripts
=======================

Oracle WebCenter Content Deployment/Provisioning Scripts


Roadmap:


1. Installs
     - WLS 10.3.6
     - WCC 11.1.1.7 (or 11.1.1.6 MLR14)
2. Configure
     - Domain
     - NodeManager
3. Create WCC Managed Server
4. Configure 1st ManagedServer values
     - Create /cs/bin/autoinstall.cfg
     - Start Managed Server
5. Configure FSP
     - Create a new rule
     - set default storage rule to the new rule
6. Apply Configuration
     - Install custom components
          - /cs/bin/ComponentTool --install /folder/CustomComponent.zip
     - Enable custom components
          - /cs/bin/ComponentTool --enable CustomComponent
     - Apply Custom Metadata
     - Apply Custom Security
7. Configure Outgoing Provider for replication
     - /cs/bin/IdcCommand -c server -f add_replication_provider.hda -u sysadmin
8. Configure Archiver sources and target
9. Restart ManagedServer node1
10. Admin Actions > Publish Schema/Dynamic/Static
11. Import Archiver package
12. Rebuild Index Collection
