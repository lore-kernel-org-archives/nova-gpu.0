Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46723347FC0
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714630; cv=none; b=flXIshnxeuFOEkJcE3uMHnB1ahT5RexWwLg3wLuMGKSzBhdbB0zlB3Gqh+6suW2niltyaOlnU2x6Z3fLics8TodSHYiZS60QhihWOLnmVSrTHR25+7Wf1VWN7B3aNeAU8lAQETerjjvJNJPJm6sFzzESHSQSSxK54Wdly/mc2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714630; c=relaxed/simple;
	bh=+I4eiRyNkoHX2kwGmYTNuaCLykOKZqpMXqcNccT+Mvc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VFkt335oduirZtAJtXpKdN2EOqvTWsIz3nXgkeOAVPoBGwmOLcRKH5sfXQ2qrPUdrnXUrnbtPsIV7mVBAlFqyHDRil7s20PNPK4swIXqk0pslz+G4wuwXc29J83DKHhXLHjL9wSkyEj6alMJyJqkuMbIoh9D9w1g17xfsyyybOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhOanSht; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhOanSht"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856FC1F000FF;
	Tue, 29 Sep 2026 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714628;
	bh=1QdUQtGpZBOclXG/K5zrAwhgVwrWhwndx2juy1qfu6Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=VhOanShtKisgQOxdUhh0WvO1nLI4+lImCAPmIKhhdmgKgnLv664LZwqF7fK0hGhwI
	 z1zbchdcqh9FDydsMDp5N5dR3c6cZT5S9sCipd1Q1lOjRlHKWoajlCg6ESGjk94CHC
	 UXZN3iP/+yVPsCDlihDl4ZrootfmTmnOim0VsgcoMxAMHYr9H+oN+y9eBF+W3s6MRA
	 0os1Pj1botqPDDEg7THy2DOdzI0g9cKwIRzxmlUaSakJxWvu7uRpJiw+u9rdgCZJda
	 QgcgTUnkTcxVqeZuWu5yXsHe5HfF4rRzSXFEKowQRvotqAqQZsKpWzW/ttCCaDTNPX
	 oxBHoz5QvDvog==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 22:43:45 +0200
Message-Id: <DLS3CUGE89P0.AV9LGT4GCLVV@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: use a single try_pin_init!() block in
 probe()
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260927144417.1280385-1-dakr@kernel.org>
 <DLQIRUGZ3L4S.2HUCTWWXHIDII@nvidia.com>
 <DLQZW9ZSEQF8.EFP3CFEMUABB@kernel.org>
 <51dccdd0-eb85-4572-be62-6ca39038cbdf@nvidia.com>
In-Reply-To: <51dccdd0-eb85-4572-be62-6ca39038cbdf@nvidia.com>

On Tue Sep 29, 2026 at 10:31 PM CEST, John Hubbard wrote:
> I really would like this restored. This is a high value thing to
> print, because it acts as kind of a bookend, showing the beginning of
> trying to boot up.

Hm...the next print in the boot process is

	nova-core 0000:01:00.0: NVIDIA (Chipset: GA106, Architecture: Ampere, Revi=
sion: a.1)

which is at the very beginning of probe and to me seems sufficient.

But a debug print doesn't hurt, so if you prefer to keep it, no concerns fr=
om my
end.

> I can post a trivial patch to restore it, if desired.

That'd be great, thanks!
