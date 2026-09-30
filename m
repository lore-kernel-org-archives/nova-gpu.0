Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1794E2CCC5;
	Wed, 30 Sep 2026 03:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740744; cv=none; b=H2FvzxeLVhwZPu9Ns2GtvHQXQNkizl8j03Id9vDchuYe5Jcl7fnVr8wjWLWthD40+YDU0FyWvNdd8Qshns35lW7rIUNcSOafsH3sffRsuD3FIm0F8bxr01Iduym8iqveUetV5T6JxD7M8M0dDMA1qT7YA+RSblLbM8UboIx0xE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740744; c=relaxed/simple;
	bh=kLR1/UBxG25ef9nWPYGTFBkdtCqhoPwuuRcz8n/6TmU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=amCEXaX8r0IUIj63PVQm7fya+KHWGbXrwGbrgwZJEHoSGOaRNYJ/agjXpkhSETr5JzAvbcvjYVvjUgh0H9jdcl/k9bhzJPnTkXmLTlzsr4dYoEZKaXyBSBZEZhbhkMwOhV2S2yOlvwg1gz4snoY4EcR1/P9M1rdfBB3pKeuTobM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcsJXNGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcsJXNGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6F21F000FF;
	Wed, 30 Sep 2026 03:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790740742;
	bh=39x0SYw0VPlAusUn9jVKGjuuuCSum7ktrBhhK3mDsMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcsJXNGHKq76n1+SdrKigZFwbRecdLWa+MwjTqIxqNUOyh4BjWDbvJq+gyptE8vlb
	 RT6nYYxT8YLdluc4ijh6QMa7EpvwmLccvb8SUWy6MQ6A6vBsrqxb18AEt6Y2BOXbol
	 brNzMR+ih5lJKuBcOuyvHZ2kmGWhMqN72ymB4SO2PR7f5QFX9ieQqTwBuTNBcqbxU0
	 8f/adE/DuCCDFV3kwPZA7sAGm9Nw7a45bptCqfSTvcla9NUxUXBfEXdg3sVbfxH+0v
	 ay2/wDoMf6G5Z95BX50CNIkIJyz0HMVCxWcTtUy0DoDvq6iucz0ZF/w6SKEtExdCrV
	 4ElLESjv6JLuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>, "Zhi Wang" <zhiw@nvidia.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Alistair Popple" <apopple@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Andreas Hindborg" <a.hindborg@kernel.org>, nova-gpu@lists.linux.dev,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Bjorn Helgaas" <bhelgaas@google.com>
In-Reply-To: <20260930034148.590687-3-jhubbard@nvidia.com>
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 03:59:00 +0000
Message-Id: <20260930035901.6E6F21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] rust: sync: wait_for_completion_timeout stack dump on large time=
outs
--

commit f89eb4d12071b7e3c61766cd1bbbd5c2cfee1ea5
Author: Joel Fernandes <joelagnelf@nvidia.com>

rust: sync: completion: add wait_for_completion_timeout()

This commit adds wait_for_completion_timeout() to the Rust sync completion
primitives. It provides a way to wait for a completion with a specified
timeout in jiffies, preventing indefinite stalls in drivers.

> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion=
.rs
> --- a/rust/kernel/sync/completion.rs
> +++ b/rust/kernel/sync/completion.rs
[ ... ]
> @@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>      }
> +
> +    /// Wait for completion of a task, with a timeout.
[ ... ]
> +    #[inline]
> +    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Optio=
n<Jiffies> {
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        match unsafe { bindings::wait_for_completion_timeout(self.as_raw=
(), timeout) } {

[Severity: Medium]
Does this code overflow the timeout parameter if large values are provided?

The timeout parameter is passed directly to the C API without bounds checki=
ng.
Because C implicitly casts it to a signed long downstream, values greater t=
han
LONG_MAX can lead to an immediate unhandled timeout and a kernel stack dump.

For example, passing Jiffies::MAX causes the unsigned timeout to overflow i=
nto
a negative long inside the C wait_for_common() and schedule_timeout()
functions. This triggers a kernel stack dump (printk(KERN_ERR ...);
dump_stack();) and causes the function to return immediately without waitin=
g,
violating the safe function's contract.

Could this be clamped to MAX_SCHEDULE_TIMEOUT to prevent unexpected behavior
from excessively large timeouts?

> +            0 =3D> None,
> +            remaining =3D> Some(remaining),
> +        }
> +    }
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930034148.5906=
87-1-jhubbard@nvidia.com?part=3D2
