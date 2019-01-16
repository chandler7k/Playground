class Solution:
	"""docstring for ClassName"""
	def __init__(self, arg):
		self.stack1 = []
		self.stack2 = []

	def push(self, node):
		self.stack1.append(node)

	def pop(self):
		if self.stack2 == []:
			while self.stack1:
				a = self.stack1.pop()
				self.stack2.append(a)
		return self.stack2.pop()
		