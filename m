Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B86F4E2F3D
	for <nova-gpu@lists.linux.dev>; Fri,  9 Oct 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791567815; cv=pass; b=aazNbj56DMiQe0vhy6O2VHDaO0RcdMOxCXyKTNs17IQ0eBXw0GQE8TbmyKlaH6sBjCMzsUDVZiQT7hAUBMI2NFTzwhbCV0c6ZePJRTLaq9uLgb9TzCbjli+DhuvKDhjts+ObPhhDKZlH0gfl/n4Le3AO4LLDvZX/mI9aNiheL9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791567815; c=relaxed/simple;
	bh=2USrELN0j9xjAwY+/mGGtPdliAWR0A+x4t3JgPpnkkc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PIHhl8v7Ue3KYcxHery3/dnI49b/aTAFZko1KrW1RjzrjPlBsO5FddsQEMxl0B9ger326OYC4+6fhraU4tQxX9sdYPO9rKHAWumFT3vHLr2ZddcITKg9rti/kcRZWt/q5vQvkHUp6u6rdOhEcAUgf2Dqu/liOnN0Vim160trVig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IcWKAHyk; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IcWKAHyk"
ARC-Seal: i=1; a=rsa-sha256; t=1791567799; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g3lMuIJlU5myjBeFh5StRCLz5OuShmhh2kujR0XJxKpacLwXUfjuTNkd/cw3J9t97El+u97tMfwSPmOHV3JzDowzCbWseNOlaZeI1QyTKNLu3zPkHkL9lVa9iI3cPpP0lQvVQeOs1f/qds/FoukeV9kaXwOmkltaGO8O6ZJ07s4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791567799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2USrELN0j9xjAwY+/mGGtPdliAWR0A+x4t3JgPpnkkc=; 
	b=T2SqrsCVVbzz0caauPWDtySNc788Z7nLCbAaPagojusYfSU1vZtTgppqhRmqlNOb8WqAtA6NJit30HDyhZ3enS9RHPl4pRFWiTHs07GfCBS3EycV5BTc2i63PkvxzVzrOBj2Sp18XEJtY9/pECb/YsI5V8PVi+QBxZWpFtLTFMM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791567799;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=2USrELN0j9xjAwY+/mGGtPdliAWR0A+x4t3JgPpnkkc=;
	b=IcWKAHykQ90adxjIX4R8u1h3dhdvXqpxsc7KWIaOIA9o6v8qjlvqTnAJEyosBRfT
	NMFlgtITRsQwZVQyLRPRJfFhzPm/HM2kVT3Rn0lBaZr4gIGvrNG6FLYLd81sqjyC6uG
	Oa865Z1qL+ug4uohLwJm/jVxA4jDbGWcB6NqDtXY=
Received: by smtp.zohomail.com with SMTPS id 1791567797840227.23013293258816;
	Fri, 9 Oct 2026 10:43:17 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 4/7] rust: fs: add iminor() helper
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260814230923.1292966-5-dakr@kernel.org>
Date: Fri, 9 Oct 2026 14:43:01 -0300
Cc: aliceryhl@google.com,
 acourbot@nvidia.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 work@onurozkan.dev,
 brauner@kernel.org,
 lyude@redhat.com,
 j@jananu.net,
 alvin.sun@linux.dev,
 deborah.brouwer@collabora.com,
 laura.nao@collabora.com,
 beata.michalska@arm.com,
 nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6395D58C-F3CC-4B2E-8B20-6EEEB92070DC@collabora.com>
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-5-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External



> On 14 Aug 2026, at 20:09, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> Add a Rust helper for iminor(), which extracts the minor number from a
> struct inode. This is a static inline function in the C headers, so
> bindgen does not generate a binding for it.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/helpers/fs.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/rust/helpers/fs.c b/rust/helpers/fs.c
> index 789d60fb8908..d6f9782db178 100644
> --- a/rust/helpers/fs.c
> +++ b/rust/helpers/fs.c
> @@ -10,3 +10,8 @@ __rust_helper struct file =
*rust_helper_get_file(struct file *f)
> {
> return get_file(f);
> }
> +
> +__rust_helper unsigned int rust_helper_iminor(const struct inode =
*inode)
> +{
> + return iminor(inode);
> +}
> --=20
> 2.55.0
>=20
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
