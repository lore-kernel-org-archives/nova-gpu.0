Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56F1409604;
	Tue,  1 Sep 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273964; cv=none; b=uI7/zni+eYSLXpYxiZjlDzPlucCnqrZv1Yu0jSE2c7Ep5tDcVN8p5TyKSYAtmrG8lXx9LO1/iUXT7G5s1ieCAozkvb+aXX4wXtqAWTMOgamjX7ozgmQ1VX2nNJ+/R9jwsjx8Viu8eqsOLXdz2EIf1gfAH99bd8L2F97xGBawFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273964; c=relaxed/simple;
	bh=Rg41YJ2nUOvWEs6t32nKYpxXPPh9axGRgKO3wyA/ZR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAXcKeoxcrsQze6OqNJIdO8TJQVGxkd8KhN9a9ZbjkwlL461PprVGsbdDZfoUQKH9oMk4heZg/EotPxhhhu3kufZHCi5Jt0lBRG/VhNdCki4DPwFETMi7+5stQnxo3o3inc0x4HebvEm/itYDVbySIBoogLzexiBa7UcbX1hPXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWdx8qAt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWdx8qAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958E11F000E9;
	Tue,  1 Sep 2026 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788273960;
	bh=Rg41YJ2nUOvWEs6t32nKYpxXPPh9axGRgKO3wyA/ZR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CWdx8qAtwzJhZbKule/ym3WqnzXSgCSwIIP0F2bWcHJctnhgFsci/iB0FaP0wch8x
	 RGGz2osnsh3b0KhhtVMOz4U9OdXaKuZTynnF+Fn9VpklEW+FWuQs4wU4OfIBa/DWMQ
	 5fQJG9GP0sejfdGdjk9thlqylxFXca6B+L13D9JfNmywzUCz2LLz6ow45rGRXo19Ia
	 0YtLE+ZgKeRc6MXmcqdauxdfkNfUOGvIvITNg83H9GoblEiCI0EXZp+pjIjfxJ4m93
	 0NxsDtzUvMQfsRC+O3g+lBxNDhRq+tlEO85sNfqcDbcpY85fDU5Yr0jqRqJ7W+kwFF
	 ZJQuzrTZyGH2g==
Message-ID: <b36db634-725b-44f7-bd8c-813d13e9bc81@kernel.org>
Date: Tue, 1 Sep 2026 16:45:56 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] gpu: nova-core: fix barrier usage in CPU->GSP
 messaging path
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260819-rust-barrier-v3-0-d5b7bd7e6624@garyguo.net>
 <20260819-rust-barrier-v3-1-d5b7bd7e6624@garyguo.net>
 <DKX6R86RZJIW.2HMS6X0NUP15T@nvidia.com>
 <DKX6VRIHFF71.1KWPD0ZQM2RAB@garyguo.net>
 <DKX70RBRWHC2.3KXXJYL22T8K@nvidia.com>
 <DKX7400TO0RK.1R05PZKS9Q33F@garyguo.net>
 <DKXLSOCZBYYX.1OE2DF4LYRMV5@nvidia.com>
 <DL3AYW5D121E.29D3XI699XMKN@garyguo.net>
 <DL3MXU3NQFLM.21AFT3KWNROVP@nvidia.com>
 <DL3YBS0UXYMC.1KJEZ9KWV52O8@garyguo.net>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DL3YBS0UXYMC.1KJEZ9KWV52O8@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 1:43 PM, Gary Guo wrote:
> So unless there's an objection, I'll take the second approach by moving barrrier
> to pointer accessors/updaters and mark these methods to have acq/rel semantics.
Much in favor of that.

Thanks,
Danilo
