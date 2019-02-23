# -*- coding:utf-8 -*-
class Solution:
    def __init__(self):
        self.stack = []
        self.minStack = []

    def push(self, node):
        self.stack.append(node)
        if not self.minStack or node < self.minStack[-1]:
            self.minStack.append(node)
    def pop(self):
        if self.minStack[-1] == self.stack[-1]:
            self.minStack.pop()
        self.stack.pop()
    def top(self):
        return self.stack[-1]
    def min(self):
        return self.minStack[-1]