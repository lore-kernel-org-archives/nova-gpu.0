Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7054E1C5F27;
	Mon, 25 May 2026 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779734125; cv=none; b=Hxf5TrdWvyBGvxRFKizx8lB4iuEsORWLUC1GhDclEBbtTngNeZBmOWq3na5VPOyH+SgPRjk9KlFOdw2behOxVCyl/r1q6wxHkxy7T9rhNxjhQPZBu+oge3/huLmN/WDo0OSnWSghALPZH7RqFYn+Fn4CYqJceszoNcSl+ARlxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779734125; c=relaxed/simple;
	bh=8I9hU33bJQ5PLTuDLN2eC0OwStTxwXRA6BUZDh0Otn0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rzqrhiVnCahqmgk9jnYWlRtqhltTEJarH6tVssVGfKGzWYzKligGHp5nlEON/Vm5at+tylvG/xnd72qRxKODg6GbOoMiB90k48bOGDJM6VYJkUpdFaVgp+ah5IQl7JuizJJDyc8AlbOsdbtuvtol3JIqshghuvDEwXd6cjyvpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkdbRh2/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkdbRh2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AE21F000E9;
	Mon, 25 May 2026 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779734124;
	bh=8I9hU33bJQ5PLTuDLN2eC0OwStTxwXRA6BUZDh0Otn0=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=ZkdbRh2/HgrEbR1pAOgG7yM9JHR2Yt2zro76hRt5WXIN1/XamIR8XYo+wxBURzQv+
	 sPBHbG8Eq7WNYs7QyPjeQ/G+qiUwneuNFw9r+ftJ+2rKnDsLmTLVM2bnUFampd71og
	 CeXOB8inqmfymgq9uF/ehdpV3dtevXcvfngnyVfkqzB7+BV9L43XbJ7feu8+z6rzVR
	 E5d37vx6vc35yFHZL6d9UhY+NwAWPjOOOCQrB95yI+LUxMO9qwE44X4eNIheTzAoUd
	 sJLEMSJjfyWDpEV3yj9IaByBB1t//QWbNwUKO3XcCDpjMVyFwqcC/6TaBr/DQwdsoC
	 CCx0jAdBaQX9g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 20:35:20 +0200
Message-Id: <DIRZ3BPC3RP6.14SNZGB7O9P1G@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 00/22] gpu: nova-core: vbios: harden various array
 accesses and refactor
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
In-Reply-To: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>

On Mon May 25, 2026 at 3:57 PM CEST, Eliot Courtney wrote:
> We have some code that accesses arrays based on values from firmware.
> This patch series makes a bunch of those accesses more robust. This
> series only touches accesses that are not guaranteed to be safe by local
> invariants - some accesses are safe due to earlier checks and I haven't
> modified those.
>
> This series also refactors and removes some code that can be simplified.
> In particular, it removes `FwSecBiosBuilder`, removes unused fields,
> and moves type and constant definitions closer to their usages.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Going to pick this up now, everything else should be easy to follow up
subsequently.

Thanks,
Danilo
