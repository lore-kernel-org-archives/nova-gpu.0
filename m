Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADD41D11E;
	Thu, 13 Aug 2026 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786657383; cv=none; b=Vccdjpdu9P3ZTC8LVWssxNUof6ks01NH89+ApP+zTcEJ6AOzb02LkMIw+9kIkUzyFNpbl3dsjEmKYLvbIou8thv9GUI1kirTwlAIJtfmpNLyZtnUe3JTFOOPzfXTAUxf5q7s0mBIO2pMNNag24lmFuIRvmIVnRRkDKWUefBjBUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786657383; c=relaxed/simple;
	bh=lT7oXYMsp+EjO9ULS7h444c12zwWL/fuVMl8QxMoXrg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TA8sVTcx2srv1WtW3nYz5Lkvqit3Zc4i3hnM6HUfLzjhbPJ3qX7ISNOOTO9lRXeIsfWj+BQtIY+fi4taDwC9V/AYjPAJubl7Xu09lXQ2yDyo1CFTUegnkkrcNeQ9zv+f7NA51hXXopHmjb0HdBLRZ9T0Rq+lbgd8YoyngWNiUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV/8kVYP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV/8kVYP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3C31F000E9;
	Thu, 13 Aug 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786657382;
	bh=lT7oXYMsp+EjO9ULS7h444c12zwWL/fuVMl8QxMoXrg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=TV/8kVYPg8QNFLMkpCaWsKlleGW9tArphdMc6ZoX+bTYqNRfLblfnta9kQ5oxyc+h
	 zJ9qgmPWAPd38O/cuwUjnzqjczjubo7e2W/ThGjqfztdwv0Ioi3fAEPsFUeQKS7aN7
	 9dmluEBvvagyOVX4MSBcMjPYIMVVvqlG0Rre7q8zWhW9PUcEDcol5m8nF1ppZGAmSV
	 Tt+vosGVW8dMuPn+SAC/2qhx3EbhTl0YwyqJDoZem7uTUXH1eElufeD7f22ixUxsLX
	 zb5kPVYPdNzNRxBqT4dTYu8vm9Rru3LPopRa6B91dMrAHjNMdtgYm3v3UIrdyQuq6Q
	 Xe4hr4uKnQkLw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 23:42:56 +0200
Message-Id: <DKO56JWE6439.24UKD7BFKQ4TP@kernel.org>
Subject: Re: [PATCH 05/17] gpu: nova-core: add the GIN CPU interrupt tree
 and MSI EOI registers
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-6-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-6-jhubbard@nvidia.com>

On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> +register! {

[...]

> +}

I think all of those should only be required from irq/, so let's move them =
to
irq/regs.rs
