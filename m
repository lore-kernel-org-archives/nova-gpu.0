Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAEB3B0AE6;
	Tue, 29 Sep 2026 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715041; cv=none; b=s7l1Wik/sY39vWcI4up9ZLUU9XUmowSVvBTrqBzNVqRyCbCp8HxyrfjuwWmIuFzp+SS0d8eAW8Buoz3EB8d+qnHlDBJnwsYhHkOFEDaY0JImf3i8YBnhDa94j7slRrj9tR1YQVY+fDSBcJGTRMuWXwapifS2R48fWxHnTKTMhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715041; c=relaxed/simple;
	bh=m6wj2C4OtcvRKRBX6549Ak89F48s00Sl7G6TS9CKi7M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RpO4BRHX/7yX7PDKP3fhmFehMlr6xD77mKZvEyjNX+2EQENc1Rks6jAh2cAPsPHhthcGp9MTUORXxWhc1kAVC4sVmyFhAfZFpvKEFYiMKs+ee5f94LLx1QIa1lWMlnrfJI6VxBfswnAlhI8Tp3VVgYI3zqXapBfVJP02kaxooo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIraCwcl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIraCwcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B1A1F000FF;
	Tue, 29 Sep 2026 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790715040;
	bh=ADs9ZYyqsWeL94lFD4OG3Qdzxe1lLtlhm4i2oa4wmTc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=IIraCwclqxnaJoaRUNhDz8Y3UK85mKdY0vwBn1016kOxVe1o5MzXStDS5z23m+YA1
	 miMt+ucJzN/qO1V+oKQqL0PAdZZAG3ZHkZcR3fx3uStSmPZhGSo2nx8z9SsiL8XL7m
	 ZgFqHV+X9QceLD+U7GBtZAf5BORtyxGlqY3s2rqcZ9kNmVlWCfCVw/jFcHcGn6qx1h
	 TTKDRd9OA9E4AwIJEdJEZTpQiEfyZ1hi8myg84QPTtxbFi45dJiXT0YIrQOGbEWVfa
	 U9hRqwhtDWZzDUooq+LQusqcacgiTPAx5s95dn8pPL84XPlZ3Qm/XKjMk7eAb4VUWN
	 tLl8MMBT8r+CA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 22:50:34 +0200
Message-Id: <DLS3I2C50V88.1YA81R37NW4JU@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: restore the "Probe Nova Core GPU
 driver" debug print
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260929204334.368569-1-jhubbard@nvidia.com>
In-Reply-To: <20260929204334.368569-1-jhubbard@nvidia.com>

On Tue Sep 29, 2026 at 10:43 PM CEST, John Hubbard wrote:
> This is a high value thing to print, because it acts as kind of a
> bookend, showing the beginning of trying to boot up.
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Fixes: 658c5f0042e6 ("gpu: nova-core: use a single try_pin_init!() block =
in probe()")"
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 291a047e4d86..96f2638d6400 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -102,6 +102,8 @@ fn probe<'bound>(
>      ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
>          try_pin_init!(NovaCore {
>              _: {
> +                dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");


I'd like to keep it outside of this block, as it will transform into a fiel=
d
storing a pci::DeviceEnableGuard soon.

Let's put it in its own _: {} block or before try_pin_init!().

> +
>                  pdev.enable_device_mem()?;
>                  pdev.set_master();
>              },
>
> base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d
> --=20
> 2.55.0

