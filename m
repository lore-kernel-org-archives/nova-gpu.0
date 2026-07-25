Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAD2E414;
	Sat, 25 Jul 2026 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993002; cv=none; b=UE7ip8UL3NudAPBBm8x/6YXc9Yz1ZqTe66/zp2cThTJS4gi9/t9MkrhbAmGa2tBn5lmUYx8rHNYAfIcMXdMsDabLdjWWH1LjDV5w5EEEKsTPlkRhWKm9eH1O1SvLK467W3V2iJS3WCvXcVwl3DwAhmNPQn4UIFcTMoA43sn7LjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993002; c=relaxed/simple;
	bh=s9owg8aXLsxgkxyrtMwWIh6foe3ZyS3eSXJtLPUw+3s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=kBpF8HTYOkDrVAoCOoN/d+omjxFiu/SDgyxwuHy47WoTNDw4g+xgULocyohF+uA5WerN2uWD/Whw23VgfqeNvV3FMN2082ZdrwoMhBihYh8FOmAkT+0sgbdmpeMBWcEK2wiEHAesqr91LytVeVcvGVAN26nTT5/gA5sbUOzl+AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mW7JPnbr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mW7JPnbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014DF1F000E9;
	Sat, 25 Jul 2026 15:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993001;
	bh=mZsXGg9KE++jbc7z1hu1sI4Ip54ROoAoTr5/x9ChekU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=mW7JPnbr4PFH5yEtOaI10lbALMI9YvEWddfJ6HO8DhzdGl+h9mfMicNX0iT+fmwGL
	 O15WNPWga9siSpSVOYvR2CeY4qEIyZogN6xXTCsmb5W0HflnqaQJAPlFsksrliYv1h
	 CQ9s043bxLp4I3AYi4IBATC9bIaBhF/wJNGh9keYKZJjthjayoo+KLmf/UsHjWjUUS
	 9yacHdY/kUYLReSBPz3Ia7Kh1IOdhzS83F+W+HIIa7WtrtaNuAIhGC2e9hweL41v3K
	 CfnRA1Dt6cHnx0QqpjuFuWO2LkRgyav0NSkcsEEpAE9ujDfH4A5DIfJ05D1xxd36Nv
	 Qf+kSLy8gxiaw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 17:23:17 +0200
Message-Id: <DK7R7IMWZY6Q.1BO2U2UFRF70H@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/7] gpu: nova-core: Add public driver API to
 nova-core
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20260723063046.1265791-1-apopple@nvidia.com>
 <20260723063046.1265791-2-apopple@nvidia.com>
In-Reply-To: <20260723063046.1265791-2-apopple@nvidia.com>

On Thu Jul 23, 2026 at 8:30 AM CEST, Alistair Popple wrote:
> +/// API handle for the auxiliary bus child drivers to interact with nova=
-core.
> +pub struct NovaCoreApi<'bound> {
> +    #[expect(unused)]
> +    pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
> +}

NIT: Please call the lifetime 'api, 'bound is only for the full scope of th=
e bus
device private data.
