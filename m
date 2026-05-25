Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875C2D8DBB;
	Mon, 25 May 2026 18:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732505; cv=none; b=UamdjeCSmA13tqCNDuowWiVwtWsIBqMExs3b71wJL7E+PBBvc1WrIFqq7tBmcgHvDM3DEVUwJ2xtZIXeJdAwKgiA77eDIhHvpHmpNyWNEmwRoahoU9+H/jqvhAZmamF26pq9/NM6BMMWNesxjP2TxcQVlbTEt8QzPU0n6P6r/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732505; c=relaxed/simple;
	bh=KKMZrhnipAJocvRBSp8MLoJXZRNCpfmV7Yt1iuFn+9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6NLAzCszLHOjCfd8k1myXIGmPYCYJJjimdMml6XHbHcj/547psxTqdXptsUIAjGvhJUwhne1su5ymIdLsa3OtaUYWuMjGVUC189PLEcOmWStWzGg/ZpJc7gyn7e2/sItHrSmtx+58EMC31H3jEVT/rsZhgsRP/9Y1Zd5hqxafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFatuLdk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFatuLdk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F0A1F000E9;
	Mon, 25 May 2026 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779732503;
	bh=7Af3TKqZ6J/IkI0/8uM7h0/MHCvGSTZXbOtVg9cLdf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FFatuLdk5Yox/DB+pOxc7ZBNnKlyHccQqtirihulizn4txxUHmpV2QruT3DTznn+E
	 HuRemBwC4OpBkkL199x3vYvZ6ADunW6bTE7kjdDXnAyOXVeH3Iaj4p+Wu8tvGhV5VC
	 zqLDTPhgPBnMMsVBCi+hJ4lUQL/1WPS8EBpkJPWArh3/ojVuKkUp8zshUVGDPDEei5
	 rRpMqE5cSv+MJjIqpag64sRlZGMIwrvEJBkia42drb7oi2RJiWoeaf6kN0Nyod9xeS
	 rAohY2dZThMZjusM4EQpMU6zOVGQvbincCji6SisiTiyuai+iWrRigIUSH7rkg43Em
	 WrFNSPB/mdvag==
Message-ID: <c46cee82-d4b2-41bd-af2a-686d4f6cda2b@kernel.org>
Date: Mon, 25 May 2026 20:08:19 +0200
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/22] gpu: nova-core: vbios: use the first PCI-AT
 image
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
 <20260525-fix-vbios-v5-15-e5e455251537@nvidia.com>
 <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
 <CANiq72kR0raSG33DgSxMuc-2uMa626dT=-5=ko_HBgmeOrCFZA@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <CANiq72kR0raSG33DgSxMuc-2uMa626dT=-5=ko_HBgmeOrCFZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/25/26 8:02 PM, Miguel Ojeda wrote:
> On Mon, May 25, 2026 at 4:46 PM Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> However, I'm not exactly sure it really is an improvement in terms of
>> readability and whether this is a prime example for this lint.
> 
> The lint is globally allowed since v7.1-rc3, commit 838d852da850
> ("rust: allow `clippy::collapsible_match` globally"), so please feel
> free to ignore it.
> 
> (Same for `clippy::collapsible_if`.)
Ah, I somehow missed that -- thanks!
