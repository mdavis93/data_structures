include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let(:root) { Node.new('The Matrix', 87) }

  let(:tree) { MinBinaryHeap.new(root) }
  let(:pacific_rim) { Node.new('Pacific Rim', 72) }
  let(:braveheart) { Node.new('Braveheart', 78) }
  let(:jedi) { Node.new('Star Wars: Return of the Jedi', 80) }
  let(:donnie) { Node.new('Donnie Darko', 85) }
  let(:inception) { Node.new('Inception', 86) }
  let(:district) { Node.new('District 9', 90) }
  let(:shawshank) { Node.new('The Shawshank Redemption', 91) }
  let(:martian) { Node.new('The Martian', 92) }
  let(:hope) { Node.new('Star Wars: A New Hope', 93) }
  let(:empire) { Node.new('Star Wars: The Empire Strikes Back', 94) }
  let(:mad_max_2) { Node.new('Mad Max 2: The Road Warrior', 98) }

  describe '#insert(data)' do
    it 'properly inserts a new node and it swaps with the root (root)' do
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.title).to eq 'Pacific Rim'
    end

    it 'properly inserts a new node and it swaps with the root (root.left)' do
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.title).to eq 'The Matrix'
    end

    it 'properly inserts a new node as a left child' do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.title).to eq 'The Matrix'
    end

    it 'properly inserts a new node as a right child' do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq 'Inception'
    end

    it 'properly inserts a new node as a left-left child' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      expect(tree.root.left.left.title).to eq 'The Martian'
    end

    it 'properly inserts a new node as a left-right child' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      expect(tree.root.left.right.title).to eq 'Star Wars: A New Hope'
    end

    it 'properly inserts a new node as a right-left child' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      expect(tree.root.right.left.title).to eq 'Star Wars: The Empire Strikes Back'
    end

    it 'properly inserts a new node as a right-right child' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.root.right.right.title).to eq 'Mad Max 2: The Road Warrior'
    end
  end

  describe '#find(data)' do
    it 'handles nil gracefully' do
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, nil)).to eq nil
    end

    it 'properly finds a root node' do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq 'Pacific Rim'
    end

    it 'properly finds a left node' do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, root.title).title).to eq 'The Matrix'
    end

    it 'properly finds a right node' do
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, braveheart.title).title).to eq 'Braveheart'
    end

    it 'properly finds a left-left node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      expect(tree.find(tree.root, martian.title).title).to eq 'The Martian'
    end

    it 'properly finds a left-right node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      expect(tree.find(tree.root, hope.title).title).to eq 'Star Wars: A New Hope'
    end

    it 'properly finds a right-left node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      expect(tree.find(tree.root, empire.title).title).to eq 'Star Wars: The Empire Strikes Back'
    end

    it 'properly finds a right-right node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect(tree.find(tree.root, mad_max_2.title).title).to eq 'Mad Max 2: The Road Warrior'
    end
  end

  describe '#delete(data)' do
    it 'handles nil gracefully' do
      expect(tree.delete(root, nil)).to eq nil
    end

    it 'properly deletes a root node' do
      tree.insert(root, hope)
      tree.delete(root, root.title)
      expect(tree.find(root, root.title)).to be_nil
    end

    it 'properly deletes a left node' do
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it 'properly deletes a right node' do
      tree.insert(root, donnie)
      tree.insert(root, inception)
      tree.delete(root, inception.title)
      expect(tree.find(root, inception.title)).to be_nil
    end

    it 'properly deletes a left-left node' do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.delete(root, martian.title)
      expect(tree.find(root, martian.title)).to be_nil
    end

    it 'properly deletes a left-right node' do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.delete(root, hope.title)
      expect(tree.find(root, hope.title)).to be_nil
    end

    it 'properly deletes a right-left node' do
      tree.insert(root, district)
      tree.insert(root, shawshank)
      tree.insert(root, martian)
      tree.insert(root, hope)
      tree.insert(root, empire)
      tree.delete(root, empire.title)
      expect(tree.find(root, empire.title)).to be_nil
    end

    it 'properly deletes a right-right node' do
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      tree.delete(tree.root, mad_max_2.title)
      expect(tree.find(tree.root, mad_max_2.title)).to be_nil
    end
  end

  describe '#printf' do
    specify do
      expected_output = "Pacific Rim: 72\nThe Matrix: 87\nBraveheart: 78\n"
      tree.insert(root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect { tree.printf }.to output(expected_output).to_stdout
    end

    specify do
      expected_output = "The Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
      tree.insert(tree.root, district)
      tree.insert(tree.root, shawshank)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, empire)
      tree.insert(tree.root, mad_max_2)
      expect { tree.printf }.to output(expected_output).to_stdout
    end
  end
end
