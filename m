Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E763224B1E
	for <nova-gpu@lists.linux.dev>; Fri,  3 Jul 2026 02:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047143; cv=none; b=OPLQQsdoi7V0YGD2DMlc8/nkak+pr4VadLe7wxZ/IZUXuOAYJV8puukqfElde130mh/xkiRJIumM11c5Y2h8h3xL6z8ydrLNAPpKD6aIoWbr2lKGuJzKVjcsFN0WZcIev8xqCjf2zswvSSec0Z0CqIHLjVcRWEi9Q9Cfiqrj95E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047143; c=relaxed/simple;
	bh=361I3q/utm920FJxcLT+hGFYQkhDxCuZiIOZ5DrgOLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FGgyNZGH5Gdn9zcgnl8QGnenvX36flQ653xN8NYJWUkX8TXGZWcbhdHw/XupNg4zCuKfxhIA6mvOyKdMKyol2lCGzjYIGrh7yscmOvFzuagkVVYGkc2LL6CIAGg6b1VEmx4zbV7IeYELcs4KoqNDi0UQSaS4gYz8nfeQBX1QOfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tLRSE7Z4; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tLRSE7Z4"
Message-ID: <a87b3b29-3dcf-425c-b700-da957400daea@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783047129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zJ7GRKRrkIf+wCa/0Fd1ZjdYyAMxmPw56N9bVZ1l/OQ=;
	b=tLRSE7Z4g9YxDkLPVBIR4mGurf9Yw3Xy5ko1PDzbh5boamlgWLMtZdmtYGMMCgj/O5poDZ
	8Hix9sVs3xXyHvr53uTOEig3Pz5SclCxQ4ivNIt6MsXMlqDfUN+qz7UggLEgKLJDl5CXnY
	JZzmMCkH4Q3m5qX2t7Fajgf1SXNofko=
Date: Fri, 3 Jul 2026 10:51:49 +0800
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
To: Timur Tabi <ttabi@nvidia.com>, driver-core@lists.linux.dev,
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260702192712.3450652-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/3/26 03:27, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   rust/kernel/firmware.rs | 47 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..4460fb2cd5d8 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,53 @@ fn drop(&mut self) {
>       }
>   }
>   
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the caller accesses the data
> +/// through `buf` itself.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmware::data()` as a
> +/// second handle aliasing `buf` (and `release_firmware()` does not free `buf` anyway).
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result {
> +    // `as_mut_ptr()` on an empty slice returns a non-NULL pointer to
> +    // memory which the loader does not own. Passing that pointer with `size == 0`
> +    // makes the loader believe that it is buffer it allocated itself, so when
> +    // `release_firmware()` is called, it will vfree the pointer and trigger a
> +    // bug. Reject empty slices to avoid this situation.
> +    if buf.is_empty() {
> +        return Err(crate::error::code::EINVAL);

`EINVAL` is already in prelude, you can use it directly.

> +    }
> +
> +    let mut fw: *mut bindings::firmware = core::ptr::null_mut();
> +    let pfw: *mut *mut bindings::firmware = &mut fw;
> +    let pfw: *mut *const bindings::firmware = pfw.cast();
> +
> +    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
> +    // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
> +    // buffer of `buf.len()` bytes.
> +    let ret = unsafe {
> +        bindings::request_firmware_into_buf(
> +            pfw,
> +            name.as_char_ptr(),
> +            dev.as_raw(),
> +            buf.as_mut_ptr().cast(),
> +            buf.len(),
> +        )
> +    };
> +    if ret != 0 {
> +        return Err(Error::from_errno(ret));
> +    }

`to_result` can be used here to simplify.

> +
> +    // The firmware bytes are now in `buf`, which the caller owns, so we don't need
> +    // the kernel to hang on to it any more.
> +    // SAFETY: `fw` is a valid pointer returned by `request_firmware_into_buf`.
> +    unsafe { bindings::release_firmware(fw) };
> +
> +    Ok(())
> +}
> +
>   // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
>   // any thread.
>   unsafe impl Send for Firmware {}
