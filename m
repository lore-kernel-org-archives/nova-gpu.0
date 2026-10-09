Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C7B4CDDDC
	for <nova-gpu@lists.linux.dev>; Fri,  9 Oct 2026 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543636; cv=fail; b=rTQ16XwZRioIHccbrvk5PcuCgWQiGjiDKxiUQF01GB/C3lDNFfZZJVC0eLw7y/M75HCfHBAa7Mi3fuhYMICJ2ZUXTSb/FXa4UFl1WP9tSrfl6EesFlDlW7zZDtlynddCMEO7bJL22vJ+vcKQYcO0bgaDDLp6yYj3oFO3RmWDRVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543636; c=relaxed/simple;
	bh=XtEkbREpZbYIxX+5IriBAVnBFMlVNZh0nz082vkQcMI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ATrdTU550o6HSYePEwtLtJCb4j7TiAPrv0wUrxmgDvvFk6T89f12/lv5a+ORN2r9R3F830LkpacGOAqoQCbWUsN0FeiHL4pQjUEH03y7UFPnit8UgmNJtu5n0Ru+TNRLWNT5zjKMga/+GLxkSPxro9/bpVHRes0QhcxKG3waVQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aasaalRV; arc=fail smtp.client-ip=52.101.48.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aasaalRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0sI0ZLM4ydwyl7eM4/IyRJY/X6HOB5PkzAMCEHqMNeoai2O+4K1+3EYfdVuXW3sj8td2bKZu5dRKypwT2Qpldo6k7yhBzHsf7YrlaIKNdbSUMHjqsCj6SzEFMu18kb6Yy9eWBdpamQutZ7HJGdqbHdAIoacg4snDrlUfiZZzzWX6wKTT4CgWdlWbwZQiXDkN+SE1zKKugqnftYpsxGtRuTVNnKc/D77F4gzkc5YCn8eoPBJmh75plxXKfn5DX96dScZrVk10yvNmiOFv8MTTn+WbIKWbAyjVfs/CC08A03UtNbXoayoHWNhaVft2KiUwxnUMlTFTGe8f+AZa/73qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4a5FuLmdmVSRTlI6XsiHnKSKwLM7qX8vDjWa4Q/e7tk=;
 b=kbIrtXj/h8uZyaVU4WwQiLgkYXiydep0ActTm4+edn3MSjX7YlvABJ4IUJ1p+UvKEdv/OXT6ltAY2oPvwpxkZ0IuzIzhw62QIwL7Z3IpIP/V5azNsUGgOZYCnInE7J8w5MYdVdG/HjokWIKjF82JlJTUr/CpaJpgLNwJdZGev2OfnahcjAZQ8SKpec4+yDpBVkd8/4L52Dn8M0cLOIULvK1WPJfthnakkRFBto9Z6FlWrs1QonfQ1ORpI8Hvrf2BSlk1roesfufy9WGqGkn+ppVhML3FPND2EbTsHlqDrACLinAvSRe2m4kr+E8m7tpzs2CToavgvHN+9LRpaUUz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4a5FuLmdmVSRTlI6XsiHnKSKwLM7qX8vDjWa4Q/e7tk=;
 b=aasaalRVMrs6wQvFtSkqtAZlcGnMH1akUU+MTvnJW2NJb6IHyNJ43qTyza5jX9HexrjYlyBALq5GwMksoR3BiBrEsORLbY20G5Da5fmJvrVAnlvAV4WBonyh1zQXZ5HAWNFLpQiz0DxAR3QO8RV9tOMFwO6Fd6gzi7h6+GkekCzXH4bD4gFz2EWHfI73Z1VaVQGDsH94/dEv2tgImxY2+h8lctJ4jik7BoErLNq5FELKVPk4QrsbXWWz6ZVaHSZFF0YSBhsBEpqjx6stH6noG/V8v3istwrbyYryvrDiDkFTp/Ca7LMs9JJp6ZzTfeIOO58yklRFY6VGuSvnyKoT/A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.18; Fri, 9 Oct 2026 11:00:15 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 11:00:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 20:00:12 +0900
Message-Id: <DM097HMEO20G.1LQ9B959LQ1MI@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/9] gpu: nova-core: gsp: cmdq: split the transport
 part of the receive path
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260930-cmdq-rpc-v3-0-91613f06520b@nvidia.com>
 <20260930-cmdq-rpc-v3-6-91613f06520b@nvidia.com>
 <DLT8A7TU1HDY.1NYIPVOXD044F@nvidia.com>
In-Reply-To: <DLT8A7TU1HDY.1NYIPVOXD044F@nvidia.com>
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cefb514-ff06-4c00-15c4-08df25f47f8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10070799003|7416014|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mAHopxiTatFLZPWE2u7tyA4JlaS7Cd9alvPyi3Df4JoDAbDmfzCCYZrCR7C4UoirAaMzze6eZZWwBffeB4kpOmK8lfks5yWmXKJaTiN9BRDIMT/p1vHTcpXz3X09XDAkedwepOXH74IWNsG3uyuj+LWyk7V0PNSr0GcwqXv4MMCDUoKktAF8hzvezwW8L4Q0UuS7wCXMI1v4YG2grhhqMsi0IOW5k++OUsb3XRQCSF0FrbJdzO3P+9FAt9XsmrQJ1pIxc5O04T6OrIPWSV+0S376baSOA/k0ZRZ+bnAH/sTF9k6Zvq63phFBgG5UcO7QGboM/NuAlAbEo6DIRKV9sNMjIEOmChyMhUNinWdZUZq9lvMiUBnN3TTkvtM3Ep84THhtz0Eh7FL7o0ZfLFBs1fpCwCMyfzsjVh7Ym6CqNjq6DUmLgjuijL9wceCM2wZKaF6lrSPOO8ZtbGnn2Cs3MOGq+TH4c8c+VcYNjNoZ7iC0ehbBD2Pp29InjILoc4byeG8muOGx26wwQfNnIpczPas4mv386a2on1Uym+e9fRR+uY/urXCC0+u2EK7arN3gbshBDba7aJsU5a9EUshrCiA0ZrXrqlrQe7C/kUWeQ8SRGGlaubpcVhBAOF+WlNot2SU45A4EEWimPYykWPujJZFQsF3YGMMbqsoKSMxYtwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(7416014)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGEvU3VwWDl1eG0wcnJYNnFENk9HME01R1FPU1BpYUJWbURkM0JnTGlaejdM?=
 =?utf-8?B?RTN2OXV3SEtjOVI2em1RaE9ud0psVGNZeExxOVpmWXRkY3NuYUJIazNQWGRK?=
 =?utf-8?B?UGdVRURva1pVREUzRDJZdVRtNnFsK1BJdWJDKzRsOTFLUDVYNU9lSEtHbTdF?=
 =?utf-8?B?YnhUczVmVjRrOFpyWi9ydFhkaDd6dGdkR2FXT21jSHhzSGZnT1RGZ3ZvUDM3?=
 =?utf-8?B?TVhPSVh6dEp3NVZvU3lVVCs2UXF5Tm9sK2NhVGNXcCt4aFJLbnppa2VrcE5j?=
 =?utf-8?B?b1dqNk1McnB5ZHNhL0RZK3hrOEFyMEtOVThsN045bmo5WHE0QXNJR1U2ZWwy?=
 =?utf-8?B?N1JzU2IzaFpMNEs4c3gya2dTWDNTeGZvWWhzNHlyWk5aVTh6UEY5cmtLdTdH?=
 =?utf-8?B?UWhIS0Z2aEhUWmVtMDI1c0orUTF4cGErZTFGcHBLL2s0SVFZUXBFMEdlZmlj?=
 =?utf-8?B?UEw5YW9tYkZLUkltUkFBNm8rYnk4Z0YzREpTbEtieXBtd1k5SHZ2QVFPQWRl?=
 =?utf-8?B?MXVDR0d5SlRrcDU2U0YxUnZYRmpXRHRlTlZBdHBMK0JJUjB1dDM2RS9VM1FG?=
 =?utf-8?B?OGliQTY5UFFDYVZVeWQrUFdWMTZrR3EvNHdidlBUcUtxNWJvQXc3aGc5S25z?=
 =?utf-8?B?MGJnWTJyb2RJS093a25EVlNDSzBKb2NvNmZTK2RqdHpzN1dPbVNxNjJnQ1Jp?=
 =?utf-8?B?S0NHejNIY0tadmUyRU1qVDd3bmpWdGxldi9IbURTWmM3cDdreGFhNDNaM3B4?=
 =?utf-8?B?bFFEODNYK2ppT0lQR3RTWmJQRjM1ZlRjUWNLcUY1NUw2bU9vMUZ3bkN3U1ZB?=
 =?utf-8?B?R3JubE1RL2p1MEJ1aWNtbGozV0ttQUE0VnhpRjZVSlFIVWhoSUhBYTZZdXBH?=
 =?utf-8?B?b2d4MHd3QzlIR0k4MmNDTFloRW1wUmdwaWR6ckg1aVJoVWJuNy9YWDZReSsy?=
 =?utf-8?B?aFdEQURwN2dYcTJDRFJqcE5QVmNwUndOQ2VnOWJBSHE0cHZtTUlpNlhIT2ZE?=
 =?utf-8?B?eGdmWTdlczNhQU9HcllXOTJtbW5kWEFvN0Qvb0p5dXlaWWtzVTFZODRvTG01?=
 =?utf-8?B?RzlUOG1GRkRUdGM1aHEwMEFoVzZ4TFpoeWpNQjNRdUlxdFhQT3lucVkyZXJk?=
 =?utf-8?B?a2U4djVKd3k0OUNMejhOd0s3OTlxeWh5UmFVNEladUtnTU9hUmFwU3dudE56?=
 =?utf-8?B?bU1uVFdMUW9hUmhVUklnQVBkbVNvQlM5cWxWdSt4a1FRVVNLcHRyRkJOTGJ4?=
 =?utf-8?B?bGFHYUxEOWh3NlFkcHR5SXJiU2hSL0VXVDVWanJLdlN5cmdlYTdEb1JhR2VR?=
 =?utf-8?B?b1VwZjA1ZlJHaXAzWWU5SENvWXRqOExVUm9uYVRvNXhoN3NoQUJGLzdXYmJT?=
 =?utf-8?B?WXUwcTdOb1BQeStxaHNBWUJNK0YzU1VWUVI2bndiQzBSWlFpT0ZoMUlXeGR1?=
 =?utf-8?B?aW1QYVFteitiSTZtNlZoV3VSR05QOTBjUVZyRXNJNEgyZjQvSVIxZm9zdFBn?=
 =?utf-8?B?WXBrd2JQTnhoSS9UaGltU092Rjh1NEtJamhaaHVnbWR1bHJVeVFJeWh2V2Y1?=
 =?utf-8?B?a1RTb293NVZRN0szRUhnOGRwUlBLYm11WVFVWjBBbFZ3ZnFIWlhvSmJNbzR6?=
 =?utf-8?B?aEVFZ0tYYmh1ekNxN3cxbXRQckdObC9EdlowRDJ5aVlwZnlyZ3gvWnVlY1Rw?=
 =?utf-8?B?aUlwcVdHcnEwTWpLWnVtbUtxQ3hwSG9Mc3U3M0FTdUxKNHRBdU8wRnFWN2xw?=
 =?utf-8?B?eFBqdU5xME42VkpCNVAvUytaZ1lmc0xVTjB4clFIT1FNakxyaUpRSUxYUmtG?=
 =?utf-8?B?RXliMlhYVThuc0hFbVpGMExOMUpHMDdyVnQrZEM0TEM1ZFE3K3VkMWNYZTJC?=
 =?utf-8?B?UHZaNTl3T3lwam95UHJrNHE3Q0xFYmM5NHFoaUE1ZlFSWjV5V0tjcGZVd3JR?=
 =?utf-8?B?SVFJQU5BSmNHZCt1ZlovZUlEc2Rrb0Q1eVN0bTZKOUxWeXVqV0Q1bmk4TFZh?=
 =?utf-8?B?NUtsbDZ1ckZxdkJjR1IrcDh0cmdnelA0YlFqb1hIVUxUR1BROGpzalNHY1Vq?=
 =?utf-8?B?NkdWMnV3NEMrdHEvL3JrU1Q0Mk04NUw5UFAxMy9OVDB3U0hCaXRKV1BuZXhZ?=
 =?utf-8?B?MGw4aEdwOGdOYUFvMER5dkZ2TTkvUHgxdnRkRlE4clpVdDVsN0swaWxBVWdj?=
 =?utf-8?B?emxTblpVb1NHRWVSUTgyL0xWNWRlR2dCQWltQUY5L2tDbEhBa2ZxZmNVZmxO?=
 =?utf-8?B?UUFlaHl6dTFHcWxobFM0SDlPcXpWNks1c1dFbWs1VnREYSs5REFrT3lqMDJK?=
 =?utf-8?B?Nnd2M0pnUVBOUE1sclZhcTZrZlFWR3NFTy9PYVA4SXR1dTEreGx1ZGQzUllH?=
 =?utf-8?Q?zAN5ovRLkBSYYvirb/UoUgNMTgTU7uh4b6ed+pnr02NoO?=
X-MS-Exchange-AntiSpam-MessageData-1: +rpsSBq1CVAU1Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cefb514-ff06-4c00-15c4-08df25f47f8c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:00:15.3577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QWp9e/qPhoKuXAv4WpxNuSjNsGiafFRB0GalPHlqbVtkVDpNhKpefi3j9y189TzTaCvTK2kjWue1wGc/QE6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119

On Thu Oct 1, 2026 at 1:48 PM JST, Eliot Courtney wrote:
<...>
>> +/// Wrapper type for receiving a RPC message from a command queue eleme=
nt.
>> +///
>> +/// [`MessageElement`] cannot be directly implemented for all [`Message=
FromGsp`] with a blanket
>> +/// implementation as it would conflict with other future message types=
.
>> +struct RpcMessageElement<M>(M);
>> +
>> +impl<M> RpcMessageElement<M>
>> +where
>> +    M: MessageFromGsp,
>> +{
>> +    /// Validate the RPC layer of `element` and returns its RPC header =
and its contents trimmed down
>> +    /// to the RPC payload.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `EIO` if the element is shorter than the payload length adver=
tised by the RPC header.
>> +    fn parse_rpc_message<'a>(
>> +        dev: &device::Device,
>> +        element: GspMessage<'a>,
>> +    ) -> Result<RpcMessage<'a>> {
>
> This doesn't depend on the type M, so it could go on `RpcMessage`
> instead.
>
> Also, moving this here breaks some doclinks from other locations (e.g. `
> This is the type returned by [`CmdqInner::parse_rpc_message`].`). Can
> you fix please?

Done and fixed, thanks!

>
> [...]
>> -    /// Receive a message from the GSP.
>> -    ///
>> -    /// The expected message type is specified using the `M` generic pa=
rameter. If the pending
>> -    /// message has a different function code, `ERANGE` is returned and=
 the message is consumed.
>> -    ///
>> -    /// The read pointer is always advanced past the message, regardles=
s of whether it matched.
>> -    ///
>> -    /// # Errors
>> -    ///
>> -    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becom=
es available.
>> -    /// - `EIO` if there was some inconsistency (e.g. message shorter t=
han advertised) on the
>> -    ///   message queue.
>> -    /// - `EINVAL` if the function code of the message was not recogniz=
ed.
>> -    /// - `ERANGE` if the message had a recognized but non-matching fun=
ction code.
>> -    ///
>> -    /// Error codes returned by [`MessageFromGsp::read`] are propagated=
 as-is.
>> -    fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Res=
ult<M>
>> -    where
>> -        // This allows all error types, including `Infallible`, to be u=
sed for `M::InitError`.
>> -        Error: From<M::InitError>,
>> -    {
>> -        let message =3D self.wait_for_msg(timeout)?;
>> -        let function =3D message.header.function().map_err(|_| EINVAL)?=
;
>> -
>> -        // Extract the message. Store the result as we want to advance =
the read pointer even in
>> -        // case of failure.
>> -        let result =3D if function =3D=3D M::FUNCTION {
>> -            let (cmd, contents_1) =3D M::Message::from_bytes_prefix(mes=
sage.contents.0).ok_or(EIO)?;
>> -            let mut sbuffer =3D SBufferIter::new_reader([contents_1, me=
ssage.contents.1]);
>> -
>> -            M::read(cmd, &mut sbuffer)
>> -                .map_err(|e| e.into())
>> -                .inspect(|_| {
>> -                    if !sbuffer.is_empty() {
>> -                        dev_warn!(
>> -                            &self.dev,
>> -                            "GSP message {:?} has unprocessed data\n",
>> -                            function
>> -                        );
>> -                    }
>> -                })
>> -        } else {
>> -            Err(ERANGE)
>> -        };
>> -
>> -        // Advance the read pointer past this message.
>> -        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
>> -            message.header.length().div_ceil(GSP_PAGE_SIZE),
>> -        )?);
>> +        self.gsp_mem.advance_cpu_read_ptr(elem_count);
>> =20
>>          result
>
> Previously, if we got an unknown function code or the message was too
> short for MessageFromGsp::Message or the payload length is too big for
> the remaining read area, it wouldn't consume the element, but now it
> does. If we had corrupted data that happened to pass checksum, it could
> mess up the queue (e.g. wrap the read pointer around in front of the
> write pointer).
>
> Since this nests transport, message layer (RPC here), and content layer,
> it might be worth saying how each should be handled. Here's the previous
> + semantics with this patch:
>
> Transport:
> - Timeout, ETIMEDOUT -> no change
> - Bad checksum, EIO, not consumed -> no change
>
> Message:
> - Unknown function code, EINVAL: message consumed in this patch
>
>   If we get an unknown function code, we can't know if things are still
>   in a valid state, so I think we should not consume the message and
>   return an error here.
>
> - Known but unexpected function code, ERANGE, consumed -> no change
>
>   Think we have this since we don't have async GSP message handling
>   implemented yet so we use this to drain the cmdq of misc messages.
>   So all good here. N.B. we are implicitly relying on the discriminants
>   in `MsgFunction` essentially being an allowlist for events we can
>   drain, otherwise we hit the case above (in the code previous to this
>   patch, at least).
>
> - `slice_1.len() + slice_2.len() < payload_length` hits, EIO, consumed
>   in this patch
>
>   This will mess up the read pointer.
>
> Content:
> - Payload shorter than MessageFromGsp::Message, consumed in this patch
>
>   This is another weird scenario that shouldn't happen. Arguably we
>   shouldn't consume the message here, but this patch changes that
>   behaviour.
>
> - MessageFromGsp::read fails, consumed -> no change
>
>   Not sure, but seems a bit weird to consume this here.
>
> - Payload not fully read, warning+Ok -> no change
>
> We could solve this with a custom error type for MessageElement, or
> return Result<Result<Self>> -> the Result<Result<Self>> is arguable
> since we are returning the result of the content layer.
>
> Send path semantics look unaffected by this series to me.

The rebase on top of the interrupt series (which changed the semantics
on the receive end) should make the next revision less impactful on that
front, although messages are consumed even if they have an unexpected
size because the `RpcMessage::parse` call is now performed inside the
`MessageElement::read` implementation, so the transport layer cannot
tell the difference between an invalid message length and other kinds of
errors.

I would not worry about this detail though, because 1. r000 will put the
message size into the transport layer, removing that issue entirely, and
2. the correct thing to do (which John tackled in his r000 series) is to
mark the command queue as invalid by e.g. setting a poisoned flag and
making further uses of the queue return an error, as such mismatch would
be a firmware bug and thus not a recoverable situation.
