import rclpy
from rclpy.node import Node 
from custom_interfaces.srv import GenerateKml 


class Kml_Node(Node): 
	def __init__(self):
		super().__init__("kml_node")
		self.generate_srv = self.create_service(GenerateKml,"kml_generation",self.generate_kml_file)

	
	def generate_kml_file(self, request, response):
		try:
			self.write_kml(request.coordinates)
			response.status = True 
		except Exception as e: 
			response.status = False
		return response 


	def write_kml(self,coordinate_list): 
		print("generate kml")



def main(args = None):
	rclpy.init(args = args)
	kml_node = Kml_Node() 
	rclpy.spin(kml_node)
	rclpy.shutdown() 


if __name__ == "__main__":
	main()











