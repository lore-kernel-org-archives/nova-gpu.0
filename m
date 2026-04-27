Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E8238178;
	Mon, 27 Apr 2026 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302697; cv=none; b=RysBts2T56v28gpPg/YKVpmSTIfxr9QADmr6z9XhU9Kek68aZMhJWHeoUO3flI9z0bVl1N6Hqru/9mqm4Z88vdtPxxrcn4ZfWqEyZBR0G+D/xidvigQUNstHOF367MtkkW2Ir6ra5IXcDIKZDZUe/uWG5Anh2EEIiP8v34audWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302697; c=relaxed/simple;
	bh=hfr1p6To/4GS3tFykCwDBeBnFhWiJRi2WSks8JkUsbU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lZRRYlOvmYMNKubTUZ0kDDCIRcJnIHEGnhIWr2k4rCeXgmQB0CmQsp2TynV821Lfco1FbvGEbtseI1EsqYfNEozHUaYU8Ope2VBgHMrKjM6gnHZV2mA9Zx+p+yfAzE+4zHLiQ9q9wYN8ykdr2tN9dEAgNwlbXCZlTwEsfX/b5O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PbkRnXyD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PbkRnXyD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17D4C19425;
	Mon, 27 Apr 2026 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302696;
	bh=hfr1p6To/4GS3tFykCwDBeBnFhWiJRi2WSks8JkUsbU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=PbkRnXyDNmsnZ75q4HzgxKvOdViX7LEnQs/5Jog6S3zjTukPOQlwxN/MEaIMH9cMI
	 2WJwt/bd05qRrMTaZa7ypVsVRfTAptOuCYHaJ1kM/hBdGwyb8tLfWkxIVfcbeIR8Pb
	 Jbp5QUpCe3zyKR9xqDdUA1fq7W5qLet1D9gUkL2LAcQMSDzDL4bRKanT6dYbzg0WLG
	 +uaBm97+QV5SxlilKJcqcEC72XBvKOTqO8h9Bed9AxDftLzl9h6Y0SUmqnkTuVQa4K
	 PoBSjyVXTTFRrJKmiLcILkhT2A3SZPNhHquHB+9EPpifvHKYjyF+f3Aq9XHXKR7CsT
	 Wq9SUAHU7FpDA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 17:11:34 +0200
Message-Id: <DI4182393287.15SOG3EG0XFS7@kernel.org>
Subject: Re: `Option::filter` in nova-core/firmware.rs
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <ae98EolO8LU0rZ5R@google.com>
In-Reply-To: <ae98EolO8LU0rZ5R@google.com>

On Mon Apr 27, 2026 at 5:09 PM CEST, Alice Ryhl wrote:
> I'm seeing this clippy warning with latest nightly rust:

Thanks for reporting -- there's already a patch [1] from Eliot for this.

[1] https://lore.kernel.org/all/20260423-fix-filter-v1-1-b3b197c65daf@nvidi=
a.com/
