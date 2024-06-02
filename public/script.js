document.getElementById('searchForm').addEventListener('submit', async function (e) {
    e.preventDefault();

    const formData = new FormData(this);
    const searchParams = new URLSearchParams();

    for (const pair of formData) {
        searchParams.append(pair[0], pair[1]);
    }

    try {
        const response = await fetch('http://localhost:3000/search', {
            method: 'POST',
            body: searchParams,
        });

        const data = await response.json();
        const resultsDiv = document.getElementById('results');
        resultsDiv.innerHTML = '';

        if (data.length > 0) {
            const table = document.createElement('table');
            const headerRow = document.createElement('tr');

            // Define table headers
            ['Id','Nome', 'Título', 'Descrição', 'Data de Início', 'Data de Fim'].forEach(headerText => {
                const header = document.createElement('th');
                header.textContent = headerText;
                headerRow.appendChild(header);
            });
            table.appendChild(headerRow);

            data.forEach(row => {
                const rowElement = document.createElement('tr');
                Object.entries(row).forEach(([key, cellData]) => {
                    const cell = document.createElement('td');
                    if (key === 'ID_Projeto') {
                        const link = document.createElement('a');
                        link.href = `projectDetails.html?id_projeto=${encodeURIComponent(cellData)}`;
                        link.textContent = cellData;
                        cell.appendChild(link);
                    } else {
                        cell.textContent = cellData;
                    }
                    rowElement.appendChild(cell);
                });
                table.appendChild(rowElement);
            });

            resultsDiv.appendChild(table);
        } else {
            resultsDiv.textContent = 'Nenhum resultado encontrado.';
        }
    } catch (error) {
        console.error('Erro ao buscar dados:', error);
    }
});
