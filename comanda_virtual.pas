{$codepage utf8}
program ComandaVirtual;

uses crt;

var
  nomeCliente, opcao: string;
  codigo, quantidade, totalItens: integer;
  totalPagar, valorPago, troco: real;

begin
  clrscr;
  totalItens := 0;
  totalPagar := 0.0;

  writeln('<------------------Comanda Virtual------------------>');
  write('Digite o nome do cliente: ');
  readln(nomeCliente);

  repeat
    writeln('<------------------Menu------------------>');
    writeln('I - Incluir um item no pedido');
    writeln('F - Finalizar o pedido');
    writeln('S - Sair do programa');
    write('Escolha uma opção: ');
    readln(opcao);

    case opcao of
      'I','i':

        begin
          writeln('<------------------Tabela de opções------------------>');
          writeln('Código | Item        | Valor unitário');
          writeln('10     | Pastel      |  R$ 6.00');
          writeln('11     | Pizza       |  R$ 4.50');
          writeln('12     | Pão         |  R$ 0.15');
          writeln('13     | Café        |  R$ 4.00');
          writeln('14     | Suco        |  R$ 3.00');
          write('Digite o código do produto: ');
          readln(codigo);
          write('Digite a quantidade desejada: ');
          readln(quantidade);

        
          if (codigo in [10, 11, 12, 13, 14]) and (quantidade > 0) then
          begin
            case codigo of
              10: 
                begin
                  totalPagar := totalPagar + (6.00 * quantidade);
                  totalItens := totalItens + quantidade;
                  writeln('Produto: Pastel');
                  writeln('Quantidade: ', quantidade);
                  writeln('Total item: R$ ', (6.00 * quantidade):3:2);
                end;
              11: 
                begin
                  totalPagar := totalPagar + (4.50 * quantidade);
                  totalItens := totalItens + quantidade;
                  writeln('Produto: Pizza');
                  writeln('Quantidade: ', quantidade);
                  writeln('Total item: R$ ', (4.50 * quantidade):3:2);
                end;
              12: 
                begin
                  totalPagar := totalPagar + (0.15 * quantidade);
                  totalItens := totalItens + quantidade;
                  writeln('Produto: Pão');
                  writeln('Quantidade: ', quantidade);
                  writeln('Total item: R$ ', (0.15 * quantidade):3:2);
                end;
              13: 
                begin
                  totalPagar := totalPagar + (4.00 * quantidade);
                  totalItens := totalItens + quantidade;
                  writeln('Produto: Café');
                  writeln('Quantidade: ', quantidade);
                  writeln('Total item: R$ ', (4.00 * quantidade):3:2);
                end;
              14: 
                begin
                  totalPagar := totalPagar + (3.00 * quantidade);
                  totalItens := totalItens + quantidade;
                  writeln('Produto: Suco');
                  writeln('Quantidade: ', quantidade);
                  writeln('Total item: R$ ', (3.00 * quantidade):3:2);
                end;
            end;
          end
          else
            writeln('Código inválido ou quantidade deve ser maior que 0.');
        end;

      'F','f':

        begin
          writeln('Nome: ', nomeCliente);
          writeln('Total itens do pedido: ', totalItens);
          writeln('Total a pagar: R$ ', totalPagar:3:2);
          write('Digite o valor pago: R$ ');
          readln(valorPago);
          
          while valorPago < totalPagar do
          begin
            writeln('Valor insuficiente! Tente novamente.');
            write('Digite o valor pago: R$ ');
            readln(valorPago);
          end;
          
          troco := valorPago - totalPagar;
          writeln('Troco: R$ ', troco:3:2);
        end;

      'S','s':

        writeln('Saindo do programa. Até logo!');

      else
        writeln('Opção inválida. Tente novamente.');
    end;
  until ((opcao = 'S') or (opcao = 's')) or ((opcao = 'F') or (opcao = 'f'));
end.
