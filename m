Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938124D178D
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603308; cv=none; b=dqFlAip23VumWXL1ROTaUAw6aq4gqG1MATjmsMtqa5MRbPMORo8VOT8jJ9viqF/b3otAsrgXVt3FjaTvLTsXsd6bi/DXpCmO0iD4XKh/EpPL4y8L51LuPvCmrcx3yfZnRhVWOe9iB+vs0MwjXVLoVEFzNawre2adBE2DEQjsJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603308; c=relaxed/simple;
	bh=DoFmpe5dH4D15u8tAPjmGxEH71pXp6AyIiL++gOhPuI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=MR9v8X6rzonSEZx/US3RZdIfhFOETAc1OUBotKjtvzMkmaNY2t9fwH0OFd4Hbvi4h8o6EkqR8IAPwovFn4pntdbpZ/S9NngNUiREXverayEc/IMZHbUSRT38C5TEk/NCHcekUVE6nX6kl4XYJcItR2Yj2iINg0md/wO8AOUdzS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VvQ0AYQo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VvQ0AYQo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F057A1F000FF;
	Mon, 28 Sep 2026 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790603307;
	bh=DuZ9RG51Y4GEDXhLouoO+o5u6/tFI+61S6wJ7IA4vKc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=VvQ0AYQouiS0Ta2PPVFnkaQ4fZOiLCISxsCOrJfat5gqE6V1fEALaxJY/HrwJgiRV
	 f//Qt/oqzyNJFH3rlATAYaJU/LqhWY5MKqU4c1pGPNL5XOKUJek5wZS0ihWGmEN6pj
	 xpOtOWolxKjbxfgNS5hsLJiQ8RMd1YailLKDUZf0XU5edPcXxUJjeyV2xucF5IDboJ
	 8sm+TP0veTSdoEJDalDI83u9yvP3VJwKYFGRytYpNsrdNyMNJqqwE1B6D5ESKfApDD
	 lfTMSfIPhJjIlDgAX4rSnX+S7Gbz9NsMgwEe4ZEqWSUxhNQUd0e/uU7RaowBlXoCqq
	 iyCbXfKOjH03w==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 15:48:24 +0200
Message-Id: <DLQZW9ZSEQF8.EFP3CFEMUABB@kernel.org>
Cc: <aliceryhl@google.com>, <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use a single try_pin_init!() block in
 probe()
References: <20260927144417.1280385-1-dakr@kernel.org>
 <DLQIRUGZ3L4S.2HUCTWWXHIDII@nvidia.com>
In-Reply-To: <DLQIRUGZ3L4S.2HUCTWWXHIDII@nvidia.com>

On Mon Sep 28, 2026 at 2:23 AM CEST, Alexandre Courbot wrote:
>> +        dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
>
> Don't you want to put this in the `_:` block below, so it printed at the
> actual initialization time instead of the time the initializer is created=
?

No, because the :_ block below will become the PCI device enable guard soon=
. We
could put it in a separate :_ block, but that seemed odd to me.

In any case, we probably should drop this dev_dbg!() entirely, as its value=
 is
quite limited.
