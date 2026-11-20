Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164914;
	b=H72o+/lJP67MIUCFvpT3F4lTJXzPhT91xDHB1GaJeYK3Q56nQ9I4zsRwARLfyQhAGp4Z
	 QYCIEq7FRCJtG4FWc6nFcWZQ6Bo+98u9rlwTw/e/RU+uwl07CcMhOihcGDYgwETiHPjri
	 ztcivS3mj9QRMDhZ9QiojQrF6LXnMWUZiQjQJDmdsB5RzWhesrpT7txahLWk6iHQJdgkp
	 FVxjA7Y5EMw9Fyd0U0rUtqWwkLFGRP5UrBDnSZKW23HGa+MVs7Aru7FpjTd9kfYyig480
	 Rjonq81YMGgzxvSq9WsM6pKnu0Dj/Pn3zwGyOaItX2TZxUXTvq9Ny9+IkYx5kjMgjDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164914;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bCjbTJGJI6ex7wHpDHXP5CHa6gyVnPTie7nxrKBqj3Q=;
	b=uZmfMpXfg8Fsii7JzBQVKVyTgjx5SiQfc6YxalN/R3GQVlI1zlwPLoMVa2SuvFuMYeGP
	 n7vNyW1RsvdN1yF8O4io3+UoqHLt/sLH4Jd+ZOcdDnVrYM14RQuQ6iVx6BN6En7yN3yzr
	 Ykm+9sphDEFJGnt6zH5piKvQ/J9gTZMFBv0hQmZKwBSNQG6Mno+0BzvgOI8jJN0M06CCM
	 FB4h/5OtsXrYAJSRCKM54vyo+B9l1VAkBtiZAP8Jew3SeDWnYmA/OalqNrKTCsUHj/Izt
	 2l9BmhlAbgeyZ4vzGkyRPdv+zs3XmVkFzxPAD0YOH49/ZWOEpygf6pE/3qsmkMi/ZtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIe3sTAU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC8606A32C;
	Fri, 20 Nov 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIe3sTAU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D139F1F000CF;
	Fri, 20 Nov 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164914;
	bh=bCjbTJGJI6ex7wHpDHXP5CHa6gyVnPTie7nxrKBqj3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIe3sTAUxPep7q7CdZ7dgYYzpLC42CPAGCE7Zu2j2i5XkdVVDULvzZuXDkngRBGP4
	 p32zP8LmRfeNPODzvd99T7g5E3SV4W+hvEbkCzoKBS7hAeuvYQx8hriflXSP/VrCfB
	 L8irnBPoukEEW3Or/+EYOrfgEfLqYq3rs8FUQRwbY8KLYrWkGuH88y/Wv40Q0D94iH
	 a5s/4rdxXvf1woagFGDzfjxSS/M5IPXVp7VdwQO7YW6TefiNnAoI9zSYte+Gy0ZhpT
	 XzZ62mOlCNNBF6hkfingEKwYnsQBwCH/J8+VcQUVbNU0Z+TpKa1EZbUqmOKukoPRFJ
	 Xllja9LUcbXtw==
Date: Fri, 20 Nov 2026 09:55:06 +0100
From: Christian Brauner <brauner@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com, 
	acourbot@nvidia.com, daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] rust: fs: add iminor() helper
Message-ID: <20261120-nahrung-wandmalerei-signal-8dce8ca30754@brauner>
References: <20261118163203.2483856-1-dakr@kernel.org>
 <20261118163203.2483856-5-dakr@kernel.org>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118163203.2483856-5-dakr@kernel.org>

On Wed, Nov 18, 2026 at 05:29:45PM +0100, Danilo Krummrich wrote:

Seems fine,
Acked-by: Christian Brauner <brauner@kernel.org>
