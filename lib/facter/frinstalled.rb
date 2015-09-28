Facter.add(:frinstalled) do
        setcode do
                File.directory?('/opt/fusionreactor')
                  'yes'
        end
end
