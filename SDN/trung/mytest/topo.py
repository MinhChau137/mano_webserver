from mininet.topo import Topo
"""
Tao mot mang ao co 4 switch duoc noi voi nhay thanh mot vong Ring
"""
class MyTopo(Topo):
  #"Topo gom 4 switch duoc noi voi nhau thanh mot vong Ring."
	def __init__(self):
		# Khoi tao topo
		Topo.__init__(self)
		
		h1 = self.addHost('h1')
		h2 = self.addHost('h2')
		h3 = self.addHost('h3')
		h4 = self.addHost('h4')

		s1 = self.addSwitch('s1')
		s2 = self.addSwitch('s2')
		s3 = self.addSwitch('s3')
		s4 = self.addSwitch('s4')
		
		# Tao link ao giua cac switch-switch va host-switch
		self.addLink(h1,s1)
		self.addLink(h2,s2)
		self.addLink(h3,s3)
		self.addLink(h4,s4)

		self.addLink(s1,s2)
		self.addLink(s2,s3)
		self.addLink(s3,s4)
		self.addLink(s4,s1)
topos = { 'mytopo': ( lambda: MyTopo() ) }

