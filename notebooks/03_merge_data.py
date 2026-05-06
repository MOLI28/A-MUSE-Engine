import pandas as pd
import os

# Define paths
data_dir = '../data/'
trans_file = os.path.join(data_dir, 'train_transaction.csv')
id_file = os.path.join(data_dir, 'train_identity.csv')

print("⏳ Loading data... (This might take a moment)")

# We use nrows=50000 to keep it fast while testing
df_trans = pd.read_csv(trans_file, nrows=50000)
df_id = pd.read_csv(id_file)

# Merge on TransactionID
# This combines the 'Money' data with the 'Device' data
merged_df = pd.merge(df_trans, df_id, on='TransactionID', how='left')

# Save the merged sample so we can use it for our Graph import
output_path = os.path.join(data_dir, 'merged_sample.csv')
merged_df.to_csv(output_path, index=False)

print(f"✅ Success! Merged file saved to: {output_path}")
print(f"Total columns: {len(merged_df.columns)}")