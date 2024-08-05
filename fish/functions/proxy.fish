function proxy --wraps='export http_proxy="socks5://127.0.0.1:7890";export https_proxy="socks5://127.0.0.1:7890"' --description 'alias proxy=export http_proxy="socks5://127.0.0.1:7890";export https_proxy="socks5://127.0.0.1:7890"'
  export http_proxy="socks5://127.0.0.1:7890";export https_proxy="socks5://127.0.0.1:7890" $argv
        
end
