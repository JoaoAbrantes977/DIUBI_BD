document.getElementById('searchForm').addEventListener('submit', function (e) {
    e.preventDefault();

    const formData = new FormData(this);
    const searchParams = new URLSearchParams();

    for (const pair of formData) {
        searchParams.append(pair[0], pair[1]);
    }

    fetch('http://localhost:3000/search', { // Certifique-se de usar o URL correto
        method: 'POST',
        body: searchParams,
    })
    .then(response => response.json())
    .then(data => {
        const resultsDiv = document.getElementById('results');
        resultsDiv.innerHTML = '';

        if (data.length > 0) {
            const table = document.createElement('table');
            const headerRow = document.createElement('tr');

            // Defina os cabeçalhos da tabela
            ['Nome', 'Título', 'Descrição', 'Data de Início', 'Data de Fim'].forEach(headerText => {
                const header = document.createElement('th');
                header.textContent = headerText;
                headerRow.appendChild(header);
            });
            table.appendChild(headerRow);

            data.forEach(row => {
                const rowElement = document.createElement('tr');
                Object.values(row).forEach(cellData => {
                    const cell = document.createElement('td');
                    cell.textContent = cellData;
                    rowElement.appendChild(cell);
                });
                table.appendChild(rowElement);
            });

            resultsDiv.appendChild(table);
        } else {
            resultsDiv.textContent = 'Nenhum resultado encontrado.';
        }
    })
    .catch(error => console.error('Erro ao buscar dados:', error));
});
