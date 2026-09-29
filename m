Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56725237B6;
	Tue, 29 Sep 2026 21:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718427; cv=none; b=fLxgi5u7H+9ctZtYm0AWwBcd+iSgUjK0kUWvAacmqLgXxcsaKmQt9ue5ek35Zhrtx6j7E6MB6NwRdlV/CZO9/5MDLAQI740tRKGuMFEg9iES6QCQXJO51fYERm8qa+Mg13oj5reG0z3rRfYClW8yKaDNO1phKx1lp8z1lD6jcD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718427; c=relaxed/simple;
	bh=omq+LetL4MRKRcT8qYOdz22ZyUQKIv8D4v8p77rXEXg=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=a9DKDarwoPBECvvQ4yLctex+jVKBLRF2MkARXBJ4W6HvpSLCPKvu9dwMunkUsqIDO3W1Ft+UonCqtRobvTO8PIKrs61T4/nOMf/ee4YVBC0Om1ocHtjexXG7tzAO0GGdxchwohIb1IM+RTo73u7VP5+qluF1j2kwT/2Kkx7kh8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPXfgMdd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPXfgMdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A752C1F000FF;
	Tue, 29 Sep 2026 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718413;
	bh=omq+LetL4MRKRcT8qYOdz22ZyUQKIv8D4v8p77rXEXg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=iPXfgMdddkMoFD+lN7ZWr+NtRxHFZd6sePRra0iCxhuaxQliUwXuzpH/yuVCEoP+o
	 pB8N8JJI/DG0f1+MIPwdVOEf6UPD2wP6KbtGUorsc4Kk84Sfd5IvAR2xOFWBur4mNm
	 Rt9p0j64WjERh/DNGORuqZM+Zw8XpH5So3WehMX9Oa1UM162jQKWRJghkYlrHaPAZc
	 lQwLhuLuPzyyFYFXpSoE5HBFaurcMqEbc7s8aH0vxySIqFkqRZMm8LIytNa8bUeYRS
	 LgKe5n7cP5c0tIcZwQ6UGoHolM+96ZnazDYhk5T/INV/oqUuAKHgtsTfRcihwewpP8
	 pHF4TMnt3ZpVw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 23:46:48 +0200
Message-Id: <DLS4P3YCF18J.3BYXSPOVAN69L@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU
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
References: <20260929210749.409380-1-jhubbard@nvidia.com>
 <65f49657-175d-43f1-b172-62efe5cceb28@nvidia.com>
In-Reply-To: <65f49657-175d-43f1-b172-62efe5cceb28@nvidia.com>

On Tue Sep 29, 2026 at 11:34 PM CEST, John Hubbard wrote:
> There is a trailing " at the end of that Fixes line. Even though I
> ran checkpatch.pl on both of these patch versions, it didn't flag
> it.

Thanks, I can drop it then. (Though, I'm not sure this should have a Fixes:=
 tag
in the first place.)
