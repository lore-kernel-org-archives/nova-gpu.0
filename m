Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EA03DB337
	for <nova-gpu@lists.linux.dev>; Fri,  4 Sep 2026 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520425; cv=fail; b=S6qDddVmkLvvQSW03MT2VbI9/LOVoS35TO+VA9M4xM0SBaw9UnGAaYCoXmAQM5YJA9+/SXZFKrYoMMcxUrQZUV3LhtJkl4g046h/S0P4CFfmK05tZ+mgnnTT7nsNNF8zH3yHRyI25MA/x0fItDRJHRdQlBunSTcQkMOjkiDSwkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520425; c=relaxed/simple;
	bh=oiPc6r5VzUs2K4aDmE2gAKa2iiDndK7lLOcO4kkCWs4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=CsNTgkfuHFMlv3o+2SbnIOOscrqf0A6opWFttDxfAZBMcr7MbkvV2r+3c7r8MF4iIWjuIPPxCCAehUcBIhalqP0TNfsTR3nbMdPIR+oSpd9ZJ9uTXT3pc5+mqHogUu4A5b000AVSJuUSmfrNg8goEaS+3VZ1c+FMmfmMpSrAas8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rcejmndw; arc=fail smtp.client-ip=52.101.52.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rcejmndw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxLykjbcDCAUnbKUPh1/ypYiaEMJ9qLhwahYY4z+RlNviMmyB7Qj2Y4CjYnbPQQ2F6v4J/u6NW+BNLs/Tv1ZUcS2eRO3lRSQBoph0xIw8cS9TVpDY779zvuhQL1MBA8dNPu4RumI5pQfLVaRT4Jr4qvWbJRxWgf6p1q8c/s5uGXBicy2AIuyQAO/jnct+M0ljWUvOblmk9TRp3mARdU/R4Nh1P7WNlcumtgiql9U8mB66Mw8bnTaC5oGUo1CqWhlgLmIEjQ7p+dAivyFrNqivlk6XFY7MxNSsEHONHeW0/RA78nmtndJgthnb0hbMQfMHrB/ymgqm2nuJPNKWqAnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+msF035doO/GoNcbFj3w20XnMVy+f/q4KOl3N80ATI=;
 b=XIGxaFDPKzeCyxT8quWIllW2BxIhlfHTGJj+dujiIZzypK9XX087VaVT5+u9uRTEjJ4HbJZpJ0akaJjynTTmETHQGmZoLX68QI83oV3VAbSHlX50jxpAa17eXK6b9B8HXhPBDcM5oxLrxfot8bDFLAkH3UqhSQzQPl+t/tWeayGTLvYcwgZYF5rpna96As7aWtgbl3lV1v62f4hBXENLiABJBfFY7nbCsu+1WjAPyS5wRWB9MUsNR5YffRJiYde99JzAtot0aFMYTeq/RmCPttyzHwxt6tBTzuYyLqkYk8fAxSu60H1hCgsdp26BYd0AVLCxccFyn9vKqw2OunD5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+msF035doO/GoNcbFj3w20XnMVy+f/q4KOl3N80ATI=;
 b=rcejmndwWHu+mkRZvpIw1xznfeRb3EgoPBoyVw645AHYfRldxf1YgcfrwC8fvUJZB/E3IuQyt1v20gFFcj/NFm74dvfJTsYz/XbVYyi+qYq9b3YTTqj6nvSFzqNfZ8i1PR5F/mltuJqyPjgG1aWqB9dKjapIYJzFqrudGIUCmG8H2/I25V1N2bzbexJYmPP76WjE+dzHvNfpqyMUS/fwFgpx1IPmyeCsUShQL2YFd5/MLkKA72XJ57jZ1kGiGwZtDCVkhvlrzlKJO/c4k4pMg+buwvMVXuh8OCBJMw7Y2Ny6zV8kQWHRWGc6PPR/F7B1KHqUhBHLiRzbXU2h2KhF2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 11:13:37 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 11:13:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 20:13:30 +0900
Message-Id: <DL6HKLWO40GT.33FO5AXO9MDA3@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 10/14] gpu: nova-core: bound a GSP wait by a single
 deadline
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-11-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-11-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0269.jpnprd01.prod.outlook.com
 (2603:1096:604:255::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b4c080-4a7d-4745-1e23-08df0a758ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|23010399003|366016|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AvAuX6rh+/dd21LBx9Yk1IQbkZ637ZEF0Y1/wixahvVCCAjMpVlVL8zGbbUDxP1G5RyrVMJQs0KXSB8ADC7Et/4pk59C31McZtqXZqS1+fPCdZsq2tjukYOUmLrSnyCNzqesIKym44KpyV0fy2X0ZrTf7RPNWwwmk42Kzogy1diWV2TO6lEk1uMWT0VQCWnHUgM72ipl7Q/CH17mWI9ypp89QfZfpNcRwqVrF/Onq6K+E8ivvbS56fiasYt7jAx1CW25EPTRfB4R+upvjjOvGf9tPRw39YdzJ92gPWfXwCeXzh6SNqTQCjGFRf2x/sDfM8T7htC1gRZzwY7rC8K1NjE0xsmqJ5OqHaeZE/1Q0UcZFpjs3PJgmziivDqXlpeUFUItwga0yOOKpjWtwO2tbrfALEKVdvhdTXm7zvrUm1n3RrHvXs9wHLnVmGwZ4ZzTzZVnJKwI4rKtU5u+D7eVMn0ZvE0vlZVMA5QemgH2ExYl4H+KyuW60Ew+gaD2q4TQMrxtmUaHIU/LXjaMOMvSjzYQ5r3Tjr++pknrHFfjrelrFeQ7dpuAXlXcvFaG0LU+oHx20hg+4wZ6PFeHuVoNpxmhXLiChSBY17vPcmCyiZzJjpRtTh+SphDxaXX3qbytrYPZCWTUVhuvcp8uVhLhTBYJRybWDIEocraYle96zN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(23010399003)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXpDZUU5VDR1WGUwdVQyb2JteWZyWm1CZ09kSVM3RFVUM3NZWFkxSThZVWo0?=
 =?utf-8?B?RHd0ODkvNnhqaTRGd21FK1JFYU1VcFJDOVpNZ1lXVko2Z2dYNmdPWmxGaEFQ?=
 =?utf-8?B?YjF1T2NhQ1FNRFExd2ptejJoRWpybzhtY25mT0NXWUtxSTJ1QWl1VWxBeTND?=
 =?utf-8?B?aXdhYWNIM3Eyd2ZUQzJvb09MT1c1MnVNVW5hNzVYWENlWEpJSlZqSUcwd3o4?=
 =?utf-8?B?TktISlVRdy8zVmdoNG9TWERQZTZFWGJ2bkMwUEc5b3RtKzBHb1ptVXUyZmd5?=
 =?utf-8?B?cVh1dWRLdGVnemRiYlFmY0x4U3pya1pEUFc4am1JTEtLdm12WUJmRGR1dTk5?=
 =?utf-8?B?VWFxTkkyU2g1K1RYRXI1MDRPMDRFbXozNVMrZ0g0VXFGWm5lVTNCcEhoNDlV?=
 =?utf-8?B?bVRXUFF0VVJ5NjJjK1pheDZ5aEYwczNZVGM3eGFVNW0yZ0V4anRBVHlHK2c3?=
 =?utf-8?B?UFdoVlBWNWJ1RS95Wk5ZRTBldk41UjIwTmduQXdBbVdDTDRyVTV1Q2xkMU1x?=
 =?utf-8?B?WW5OSjVybElZcDNDUE91SFdVQVAzTHhyNnFSeThDeFRiR2pOVFBUblQ5S09X?=
 =?utf-8?B?MzBpa2dVamRXdHJ4OGY5SzBZT0p3WU5YV3MzT3Z0QjRDZmdGN3hmRDE1MUZ2?=
 =?utf-8?B?OUJZODd3WG9NYlpTN1djNzQ1eG5GK253NUNvbjNNd3d3WVVDUmRZNVMzcDV3?=
 =?utf-8?B?YVFqRW9zVDZxbWhMbkJvaDM2R1Z6M0JaVXB0OFB1UjRxY212Y0ZyMTNUUEsz?=
 =?utf-8?B?bVB5YmtvN2tHTUNsL0Y1YkNJQm44SElkSUJGZTVRTnNPeDB5VzZhYThVM0l6?=
 =?utf-8?B?TWxEWEZ0d09UUnk4b0NwMTFFRFZqUWVibllZNnZaTFJHMHdleTdnL3QwMlg4?=
 =?utf-8?B?UC84Nk5POHE0L3MrTUhzRXA3VHgrRTlsQWsyUGlrRlJSbDMyeU4vSUxXeVcw?=
 =?utf-8?B?dUJVVlZKRUFnU0kwTXI4aUdab0ZHM2tkdXNIZy9EMVBNSWRLSUQ4am53Q3Qx?=
 =?utf-8?B?ZnVBL1pZdUlONzdTYlhqVk84M2EvcC9iSFQwa1FNQUYvUmw4MGZmdjUwWVZC?=
 =?utf-8?B?bGtUbTNtNG9DNnBPd3Q4ZFd0b3I5QndYdkduV0gxMDNkS2Jtcmh0cVpHMngx?=
 =?utf-8?B?NHh2aDV2S3EyVURIQ2JIS3V6Z01Ua3dIckwyRmk0V2Z3aFVVaUx5N1VPZUVi?=
 =?utf-8?B?ZnhmN202YU1GdTJCY2VrZ3pMNVRldHZDMmpMcFYyTTdRa3dtSVdWcDd0VXdh?=
 =?utf-8?B?MWVydUNnRk1RZFpPNm1KSDVod2l0eWt3eTdWaW9WMWJ5dGNXYXpFamR5SERN?=
 =?utf-8?B?d3B6NjAwa0hIcmRtNmtiUUcrdm5rUzB4N2lNd1dudXJEYkxTUEE4TU4yNGVk?=
 =?utf-8?B?Ri9pYmpraGIrSCt3dE1mUWdLazZHMzYzM0lJL3VlNkVvL2hMaFRyMHZlRlNY?=
 =?utf-8?B?bFBQWm1paG52ZVUrZFl6emtDZGxTS0VxY2JpMm9NZjdtR1NhNFhaS1JkZ0hV?=
 =?utf-8?B?K2FDZk5sVy9qelkyYmw5M2djSDNGRnZJa3RpTDBsK2NWd1JBSU9jdkhOd3JE?=
 =?utf-8?B?dFdGNTVYLzVZNHpNUEpvUTd6eEZUcVhEcGRmUkxWb1p2aTdOdlNleFZpZDVv?=
 =?utf-8?B?STdxdTZOTWlXYzU4RGdZSllkL1lhVTRrdUJTblcrRlFpbnU4Y1Q3TTN6VjRv?=
 =?utf-8?B?UjVjYVJYcXBEYVJ2TkdUMGNDN0UvdlppeEFOSEluWXRHL3lnL3ZJT0l4S1FQ?=
 =?utf-8?B?OEQzM254QUE0V0lIU1Urei94VmtNVmcrd0ZPZ2VXQml0Zm15am1mY2JuMUZE?=
 =?utf-8?B?aVd6M3lwdllla3lQQnJlVHEzd3lwSElMMVlGeVlPd3dtbVZhTzl1dERvNTFj?=
 =?utf-8?B?c2wxTHhtRnZ1em1VY0ZXdENHb1V4aEtmQkRJKzJsWFFoeXBSbUEzQ1VWbVBk?=
 =?utf-8?B?TnAxQkY3SVRYRHBMcnRpQ05pVmt1MFlsVkpaWXh6SldINitrWFpjNjgyWk93?=
 =?utf-8?B?QkVydGZMU3JlWUR2aEtuR2VyWHo1T0llYkZPaVJDcG9Dd25RVEIwWUE4dG9C?=
 =?utf-8?B?cjgwbGtJYXRTNUNOWFdkU1BiaHZOQS9FbmZVZENOeVd1K0wxTVp5eHU3c0Nj?=
 =?utf-8?B?MXN2ZW1XNXJ1WHZEajNGNjkzYlVuSHNQUVg3YzhCcWk3ejkvUVJTcWFEeWxS?=
 =?utf-8?B?U1d4Q1NUZUtsVVZVZUhXaGVhNXVlRGNjMjB1WXVZWmtLRXYxUmpNZWVWZ1hn?=
 =?utf-8?B?bWdRMWR2N0xabDVlbi9pb3Q5ZG0yL3A1ZVI5ZHE2UVN4VThwQml0L0NhRjBT?=
 =?utf-8?B?NDRIQkN0dzdzd0RuT1FNdWxMdkFxY2xySzVGMW10VlRmcnZvdUdUS3lLdWl1?=
 =?utf-8?Q?89zCUM1xJNqr4OiUSP9vsqsRAz9FXNNQpIqS0RyrabW+D?=
X-MS-Exchange-AntiSpam-MessageData-1: i1t214S0nSuO3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b4c080-4a7d-4745-1e23-08df0a758ef3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:13:33.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8UD2ayxLOkZ5KSERnQ8ykupg1oFcET5i7Uu3XlQPuUcojjKlFbhmhdOthmnhrxYnl9h7/WStmn9wVYHxWuYDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
<...>
> @@ -611,15 +621,39 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: B=
ar0<'_>, command: M) -> Resul
>          self.inner.lock().send_command(bar, command)
>      }
> =20
> -    /// Receive a message from the GSP.
> +    /// Waits for an unsolicited GSP event of type `M`, logging any othe=
r event that arrives
> +    /// first.
> +    ///
> +    /// The queue is locked for the whole wait, for up to [`Self::RECEIV=
E_TIMEOUT`], so a
> +    /// concurrent command cannot consume the awaited event.
>      ///
> -    /// See [`CmdqInner::receive_msg`] for details.
> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) =
-> Result<M>
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIV=
E_TIMEOUT`] of the call,
> +    ///   however many other events arrive while waiting.
> +    /// - `EIO` if the queue is poisoned or a message fails framing or c=
hecksum validation (see
> +    ///   [`CmdqInner::wait_for_msg`]).

Let's not mention private methods in public documentation.

> +    ///
> +    /// Error codes returned by [`MessageFromGsp::read`] are propagated =
as-is.
> +    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
>      where
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        self.inner.lock().receive_msg(timeout)
> +        let mut inner =3D self.inner.lock();
> +
> +        let deadline =3D Instant::<Monotonic>::now() + Self::RECEIVE_TIM=
EOUT;
> +        loop {
> +            let remaining =3D deadline - Instant::<Monotonic>::now();
> +            if remaining.is_negative() {
> +                break Err(ETIMEDOUT);
> +            }
> +            match inner.receive_msg::<M>(remaining) {
> +                Ok(msg) =3D> break Ok(msg),
> +                Err(ERANGE) =3D> continue,
> +                Err(e) =3D> break Err(e),
> +            }
> +        }

This block and the one from `send_command` are strictly identical - we
should factor them out.

The right place for this seems to be a new method in `CmdqInner`:

    fn await_msg<M: MessageFromGsp>(&mut self) -> Result<M> ...

Then this `await_msg` simply becomes:

    self.inner.lock().await_msg()

While `send_command` is simplified to:

    let mut inner =3D self.inner.lock();
    inner.send_command(bar, command)?;
    inner.await_msg()
