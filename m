Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1E3812F5;
	Fri, 12 Jun 2026 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781295635; cv=none; b=Rnt0DdGF0c1oqrV4FtOSVyeh5XWmZH69RB9yJrRl6J1slfqJDklLTyGCE3PSRPsvhbdPS+D5YRwidbGFgbIUbwzs1kp+JmhRHIZ5Iccxrb3UbEgCaBRqUzFllulNLnWx1KgsVi2BbdTj+Ze//fatvmcqR7Co/Q7ixWCB2Bbgw9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781295635; c=relaxed/simple;
	bh=aGOD9nYl7XwUCvq5dGBRzDrHCjaAkfbwmgCdWRph2V8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Bjgt36qGHF+bCGNzLgW0I7G5JrcpNDqY/+S4Qpa3EVOaMl4oSZKhw5CYjGhmh1/4Q9GRi1MNgg8rs5dCPNv5NvJI0AU8d5Y+ig7n3ZuBWm4FiTahzrAfaNTfI8AIUmPmUmXBMMl52cRDBmGxLCqcRJwaarGQg8d7qDfSxhlHk5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1yCW4fQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1yCW4fQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBD71F000E9;
	Fri, 12 Jun 2026 20:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781295633;
	bh=aGOD9nYl7XwUCvq5dGBRzDrHCjaAkfbwmgCdWRph2V8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=W1yCW4fQweO5jtjTzY2qWsuQONhmu3P9WEPQzhaRBMb28NYVbVRkUzWhnhykSvXTM
	 zZNmunUG3gDcFtbeP+8VF/jtxtcK63PTaJ/9ILZflxH48/GwrJC1PYClMmGtjeG/ql
	 tNuJmgMc8uKKX85+3Gz+sjhUJ4HLJCT3MQsgUyxMc8t3h+FWhlQg2VQb7d2fSqjUaH
	 rULx7D7xylQgB5RJodxZP0xkIXVnAr5cGFz2HBkCc1TjpvDnTYPUTzdMnTIwsaRmMj
	 1dX+gMG5H72iNmKYgeX7al9ZFSVVv01x00iNSRtvpwflIwSrslyxT+CRLDuexhARX4
	 /rXkVU7fa/4+A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Jun 2026 22:20:29 +0200
Message-Id: <DJ7CLN3J37Q9.8G26CYOE2E4S@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: remove `#[allow(non_snake_case)]`
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260612123401.2684025-1-gary@kernel.org>
In-Reply-To: <20260612123401.2684025-1-gary@kernel.org>

On Fri Jun 12, 2026 at 2:34 PM CEST, Gary Guo wrote:
> This should be applied after the merge window when v7.2-rc1 is backmerged
> to drm-rust-next tree, so the pin-init changes are picked up.

Noted, thanks!
