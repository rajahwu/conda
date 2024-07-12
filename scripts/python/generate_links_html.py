import os

def find_links_files(root_dir):
    links_files = []
    for dirpath, dirnames, filenames in os.walk(root_dir):
        if 'links.txt' in filenames:
            links_files.append(os.path.join(dirpath, 'links.txt'))
    return links_files

def read_links(file_path):
    with open(file_path, 'r') as f:
        return [line.strip() for line in f if line.strip()]

def generate_html(links):
    html_content = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Links</title>
</head>
<body>
    <h1>Links</h1>
"""
    for link in links:
        html_content += f'    <div><a href="{link}">{link}</a></div>\n'
    
    html_content += """
</body>
</html>
"""
    return html_content

def main():
    root_dir = '.'  # Current directory
    links_files = find_links_files(root_dir)
    all_links = []

    for file_path in links_files:
        all_links.extend(read_links(file_path))

    html_content = generate_html(all_links)

    with open('links.html', 'w') as f:
        f.write(html_content)

    print("links.html has been created or updated in the root directory.")

if __name__ == "__main__":
    main()
