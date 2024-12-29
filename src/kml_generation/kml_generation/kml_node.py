import rclypy 
from rclpy.node import Node 
from sensor_msgs.msg import NavSatFix
from sensor_msgs.msg import NavSatStatus


class Kml_Node(Node): 
	self.coordinate_list = []
	def __init__(self):
		super().__init__("kml_node")
		self.register_srv = self.create_service()
		self.generate_srv = self.create_service()


	def register_gps_coordinates(self, request, response):
		try:
			coordinate = (request.longitude,request.latitude)
			self.coordinate_list.push(coordinate)
			response.status = 1
		except Exception as e:
			response.status = 0
		return response

	
	def generate_kml_file(self, request, response):
		try:
			self.write_kml()
			response.status = 1 
		except Exception as e: 
			response.status = 0  
		return respose 


	def write_kml(self): 





def main(args = None):
	rclpy.init(args = args)
	kml_node = Kml_Node() 
	rclpy.spin(kml_node)
	kml_node.destroy_node()
	rclpy.shutdown() 


if __name__ == "__main__":
	main()











