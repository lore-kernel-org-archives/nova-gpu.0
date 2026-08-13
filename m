Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469A6384232;
	Thu, 13 Aug 2026 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651225; cv=none; b=pwmiojfiL+dPe6LD8H9I8HDfNf/4FwG1HqpvF982vUYNac9IEW3HTRtOfdHk1obzt/JDuJbvm60Z5shXpQ3fIqEaEJan/1u7jz5o52ZWFzQYIe8GYCZDYeN3shWf+9UlsvRnpYzGBSoSpQiVJ0fwYGkuT7QOU+wPygU+RRz4yRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651225; c=relaxed/simple;
	bh=YdR1lCv2pNsCoD35ucLwZ0S+f85NVjY5MCjg/fm0UD0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=fMOKNpR3rnmLtBQSZ4qosJFd59aAKTZPf43Y/qI4th3+qJutVIeQ2+oZZTW5ErX7o3hip54ar+W/U9enCLtitONufkd5hPWaHiq/3ybefmQeqQ8AyW8l03/OtnZhaPa0LdlzW4ZuWKndKhx34gV5cj7HeNCiwch8yGehruU8nq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRqSVfFA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRqSVfFA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C6B1F000E9;
	Thu, 13 Aug 2026 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786651223;
	bh=QiaJZv1odoPlOyxmY+lNT4TcM3zQ6uvi+7GgTHIP83w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lRqSVfFAKnGHJM2qTZJ82qsKiZFKAY79vTyxmRnQ4PGHOCUscCGApKjOWSEgFPY5s
	 cbcOLZEPzOkDQH1QdqQzebLiPKRU0oGDnZ5mwjXQJp8aR2HcWgXE330MvkHcfH2wv0
	 keDIqMfpbWmv2rpRfy+RKz4jM4lk8PTcI9ByKuAcaeo9hhWO69PYqKp3Yr8OiKZVfZ
	 g9DdVq6bFRVc23qKcJdQ/870GCPkiUzbMa5hj0To85PY66yU7okulypL8mMjGRrBYq
	 87H4T3TAtMYaDrDhz5+L3HJ7d374myFLh86+tcYUKfehgNQR0UA+mi6xCEH+rfKcih
	 T0lkYxEVaKx6A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 22:00:20 +0200
Message-Id: <DKO2ZZQU2MQ9.B0PAI47OAV0I@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers
 after unbind
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "vladazaharova2018@gmail.com"
 <vladazaharova2018@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
 <20260812113752.532537-2-vladazaharova2018@gmail.com>
 <a72edc5b-49c0-42e0-b21c-940e71909666@nvidia.com>
 <5efa940cf5271c7bc0d725b7f0df365f247f08da.camel@nvidia.com>
 <aecd067a-e308-44b5-ae46-8f9947c9b44e@nvidia.com>
In-Reply-To: <aecd067a-e308-44b5-ae46-8f9947c9b44e@nvidia.com>

On Thu Aug 13, 2026 at 9:30 PM CEST, John Hubbard wrote:
> On 8/13/26 9:29 AM, Timur Tabi wrote:
>> On Wed, 2026-08-12 at 15:41 -0700, John Hubbard wrote:
>>> And so should nova! (Except for the strangely worded "keep_gsp_logging"
>>> param name.) See below.
>>=20
>> The patch set that added that parameter to Nouveau was under review for =
months, and no one had
>> any complaints about it until now.  Regardless of whether it's "strange"=
, I think it's important
>
> I'm not keeping a close eye on the nouveau list.

That was back in 2024 and when I reviewed this series I wasn't paying too m=
uch
attention on the name.

That said, the name is in fact misleading as we do not keep the GSP logging=
, we
only keep the logs.

Since we're now already in the game of bikeshedding over the name, I'd like=
 to
go with "gsp_keep_logs". :)

>> that both Nouveau and Nova use the same parameter for the same functiona=
lity, so Nova should
>> also call it "keep_gsp_logging".

There's not much value in doing that, and as I've mentioned previously in a
discussion about the uAPI, I don't want to constrain nova on anything becau=
se of
how things work in nouveau.

> Completely disagree. There is no need for these disparate drivers to shar=
e
> a name, especially given that a better name is available. I'm quite
> unhappy with your continuing efforts to add artificial constraints
> along the lines of "nova must match nouveau", tbh.
>
> Nothing is stopping nouveau from adopting nova's names, if that is
> desirable from their end.

It's not.
