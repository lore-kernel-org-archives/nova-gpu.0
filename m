Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5673ADBB4
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173224; cv=fail; b=smbiZt9lvT2458F0/t5y09oKJ9vQ4z0YCpXPaMscLmdHHWr1BFa8CZLtVRwp6+0W4/tlG9EOcI7l79udEwAG68V5lCAZQYjeVoZHVY/i2WYbDzoKKW+op3lmcWEZdo23S14tnP2/16zngYPM/tunEyQaznbmWltrQzbpldB7Kyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173224; c=relaxed/simple;
	bh=8zz+X98ZO6kj7ovPbsYVh8CHYeTGHjcq6SqVCmzDo4c=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=pGtqEr4uN60lqYyRWxLnoZTdzjl7XNIFFa9aHRbcFwABgpgGkeFE+unyTbfCZ63pKZGGA63JAmWH0fL7MJT5s7gejQa6KmdylC2wCxQhUJJB7jSSWvf7Ht7tHelH+d4Lsy6laug6tX+E4IapmKrZQqtwRDpW0VvmA21b7PktyE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qA4Q4YSh; arc=fail smtp.client-ip=52.101.48.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qA4Q4YSh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ej+O9HNHPW9mTQsN5Sil22NsMiKXsPEPfz0VeoiWI+oa6HhJ6AkmOGxdj2ASjIAz4mcUQMk1t2GrYHxNrLV/YL0ZWWxEt+nVeVIeLswIoLdx+vqfT+QcNnS058jmXFl5SPS5J2dwLyS4iraup4UH3q3g9Vb1hciiRU3dh+19jz8ojBv4b4BL9NSbNkzkfPWW1P75mELFLV35gn02sZLeapcNqhG1buB/Asdn83vujBIqh7Y8ZOtplFnDWT4rVpl+tUeypnFTT4GMiY1u3GYwCK2EphqLISsIaU/7x2qSCPW6+kmWeJufniUKzRqfg5xaCEf5KgceXtVweFb7L4E7uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QboB9lr/F/6I7QiEzBt0I8soYnplQx32l9QRLdNZDIc=;
 b=D5xmYbxy9MY5Azk7Gc8S088dgdJIk7wIOX6S92LkSVHER/o9uOFAcAD/jvXYKEeeDLt1IaR2J1vrtXFFquYBMtzbEO6sW02SZ4zujLF4+HZ9S9nPVXoqF8Ym8I6CQ2Aam6PRpjTRJEnTo0GZ7lyrrltRAISPsIRBk6OHVm63eOLdTLrnZw+HKZ5EGUdcuWXRAD2gaauATG/sbyYaWYi9Qh1KfsDn+PL9niXJ0c8WYHrZjUVAWygyHleAC78HYhzzdZMF7rHasGg7QgrxmwFs5PPmPNZRmwUQuDkOa5MObRxGFnLjyAMgeAzFslLZhwUvlHV8l+cQPGEcAopobjOQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QboB9lr/F/6I7QiEzBt0I8soYnplQx32l9QRLdNZDIc=;
 b=qA4Q4YShSnIgB8NrdOGrS/BBhdf7IXqhS/XIeTJYHC5w6Fs/LcBoCZKFwFYPpK+gfGMmvHP7Vz4E3+Ks2vM4G0yt0aPNJ8jsC4mEfJA1CTB04YfAGPpxG1R5AWticisNR09jo11Ppt/9bHQal8R0oiOa4e9LgEkShxxp7JwPMtxmQ0HjCVN54rwwLhOgBUbijFN0+Vq8LGggQoumAUn0TxwahTNo7Xj4Jl5Nf26ypQ8D7Fmq+j0i3REuWP4ynjWsXBPd4LcDQrzhWXKFUh12b5Wro0BEvHFPeNXhouT0s8l22pbVwI4UvlNm+vf8Oa0623QfezqEfeoRVcJNl8OIxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN0PR12MB6127.namprd12.prod.outlook.com (2603:10b6:208:3c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:20:17 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 14:20:17 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 23:20:14 +0900
Message-Id: <DLMRFXEKZ67U.397FO3QG6KR2G@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v3 30/33] gpu: nova-core: match GSP RPC replies by
 sequence, not just function
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-31-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-31-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0200.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN0PR12MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 168eb7fd-19e2-405d-f449-08df197dca8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xm0LZiVVOoTvq/fBi2KQC3bmIJQ52AWbM1RrPYQmhTb2ztp75XwfnZ1b8l331dEO/5Zqev+KCg+rV+NwiJsFE5F19PlUo9X23PTYY2vFje2fdR2u7wqmVXGAMc7ptsUKMPHoeVDDL7XE+Yqy+aVkRNwm/Ir/+SbOGFLBVCkC46dWvsGXg2ctsrX4KecLSiQ9ZNSzyhT/GNvJ4v6s5wlmLXor/9Ttwc8EYWLPmeBC9zGtR7yKx5sd4XbI7dEVRkwQbWPME6amqaGz8pXsmGuigfhhAUY4z0vzlrtUpFeLuTOI/yWtK0ElPFJYdadsSZAmPXJK2BgYUC6ISzoyfbaD5Or5dHhLYsV0zM2zJgXTFPYUP6HsJETl8NOOzKHQV+aq249LLEv1J+PKWtycWSq6uSRZUnpHRDFRlwQ7qKkwLmuRC3IIjfmp/lhhAr+Z4XqkvoXUFiqduN2GJ/B1I0GyuHdu4aEdzPwdiCUblHZaukA2ExeE+B5sgjZ/7B02HRHVVSCTrp+h3xq9HcqYl9gZ4O/aiu83mErE9K9uwJO1t8Q0fjvdiEiYe0gYwpVLSRmCTLLguyzySkG+GF008l+S/x6QfVyUS7A7+kksEUl3JoNNfZjU7ArX8k7cQFDr9zcz1tQ8LcxN86g04crliW/e5Jc3JSAoatmjoyGKdp3gpgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJGdC9xWjgxbmhpT1g5NHhwMGdKVi9DR2trM1BUMGxwK1F2bnFnY3RSd0Y5?=
 =?utf-8?B?R3VoSTVWd2hmNDlQMVRBRElkdXF0VytmRno3c21zUVZQTTNGTm9FekRXWFF3?=
 =?utf-8?B?TlFUbmphcU1Da0VwTXprMGJydU1UcGZ0c1JZL21rWEZ0dlV4eXB4R1pZQWNP?=
 =?utf-8?B?OEtlV0tQS1liU0hHV20zWEMra01qbDYvQU5vYWEzM3hseHdDZDFwazJaOWlE?=
 =?utf-8?B?NWlaSWNNaEp6RnRucWRUUy9QbS8rUmlLbkRORHB6c3hvczJiMmlRd2IwK2Zz?=
 =?utf-8?B?VkZIalZQSHc3ZWl0cEJCdzdVRTdZVktEYUJyNkJxS3BlcGJ5eHYrclpRd0hk?=
 =?utf-8?B?ZlJRVmp4bTJjZkJCak56eDZ0c3JyaEhQem90cS9nUkdjVTBqSWgyRTlFbEhz?=
 =?utf-8?B?SCtXZGZqWUxJTy9ZZlhEdjJ4VS9wTzZSaGpYZjhMelhsckVMRHVrdUxVVUtK?=
 =?utf-8?B?QXgwUTZ5amlacHpTenR1RTFZTkpJQUNXekloVFpZYzNmV0orVHZjNWZJQVMr?=
 =?utf-8?B?dGVwZ01IT1lHbUlkVmlnTGF1NG1WbVh5Sk5MU2dDOTczdEU3THpibkl1SDhx?=
 =?utf-8?B?WUpRWG4rYSs5TnhHakRHdmNSTS9OMUZCRFg5dEMzR0luSEFxbTgxSklaKzBr?=
 =?utf-8?B?aHEydFNvQXpjRHFNeW9rNGUySFZHWEhxNWsrbEMxcFltUzkwRUdlWjZ1RmYz?=
 =?utf-8?B?S2ppTUF6dkM5aURKclJuZ0JhQ25QSUcyejRoZWY0TFVIQ3RocWs0RU5NUVBB?=
 =?utf-8?B?aGlpV1EzTEdndFRzOEpjdDVXWUhXNUg4Y2syZ3VpQ2dkSlpTM2VJNG5vekZw?=
 =?utf-8?B?UjRDVkp2ZVRrTmdxWG5NZ0I5cmdKTGxWNUIrT1BMdlpBRGZHZG5DdXI0SkZ4?=
 =?utf-8?B?ZkpVK2p0WFN5a1N4Q0kwM1UrR0NPbnh0MlNkSU14am02WkkyVlR6L3BVWjJZ?=
 =?utf-8?B?aEhSdGxqbk5jWGRxdk1NRWRrVW1jb2gyOUIrK3JFZkNvWVBEQkhSeHNLWGVM?=
 =?utf-8?B?NXlpVFB1SjlZakRrc25WeGZYSnBpZjFNaWN4MDJGOVNsVWRCdWZpTHNXVnpk?=
 =?utf-8?B?Q3g2RDkrak1WNndNM0tyakF4dHRrbGtpWDV3NWhuZDl4VXpNL0krVDg4bmVG?=
 =?utf-8?B?UytlbTh2cU4yaUUzUy9KKzdwRzB5alZ3UE41MzlURlRHY3N1alFIL082OGM0?=
 =?utf-8?B?TXRSKzlBRzNySEpHZ3ZGWjEzOU1McWN6aXB5YjA0bEFkTlFUcEt6Z3NMMzB5?=
 =?utf-8?B?MDBKVjNqa1FJMldaVXgrNFR4Qy90R2VkY3JnTGxCZDlCQk90NUxTaWhzRDVt?=
 =?utf-8?B?RktoUGxpQXBiYVJ6VGZtSVVpc050d2k1WjZQamUzQW1QUVVkOFZ3M3VGcHd6?=
 =?utf-8?B?V29CbG1UUWZiaXRYcmdKbW54MFkyUXptMnBwNGVhUW1kWXFhNkhMazJmOCtC?=
 =?utf-8?B?amM3QkkzREJsSllGZUJYSUpzSkxJdDRmMGFSUGMxWlpIcktCZnlTRjU0MzNY?=
 =?utf-8?B?YnBPUkpvSlBKWlVjU1RQQ085cFFUTzFQYkRRcHFFbzJiQ0xBU2lSMlk1dHdR?=
 =?utf-8?B?SVA3MmxwTVdkVmZaL2J1RVJFOHdqSHRjTUlSb1pkSU5yV0xlbHZmenQ0dXJj?=
 =?utf-8?B?QWVDbzF2a2dMYkdxdmxzZE9Ednd3Rmo1Sm5KVDFlOWd5Nmhndy8xa1hGcWV3?=
 =?utf-8?B?MFpkcGxrVDZBc215U0FPeElYYi8vN09Ddithc0lndjFyY0lseE40bGNHVXFj?=
 =?utf-8?B?OERvcnFzU0JwaDRzcWZxSWlXeG1ydStVdDk1MkpZY2FVNjZjTlZQdXc3R1Uz?=
 =?utf-8?B?SzZaU3haWGt0WmRIMm9JTk9ETDlmZ091UjJnaHNhRWhPVmpYSDA3L0lDRHkv?=
 =?utf-8?B?YXN5N1JmcnVPOGxsbFQ2V3FkY0JWck9BQkJGTjNXL0pNaERxdEliTUVHbDZ4?=
 =?utf-8?B?ellzeGUwZ21zMFN3b3B1SDQrTTJRdEl1cGZYQ3hnSE42RW5adkt6NG5kR3JZ?=
 =?utf-8?B?eW0zaUxSZkFVK3hySjNiUWtSSE9QbVZpbnp0Ykg3SWRNRFBIVG82TTh6QXRZ?=
 =?utf-8?B?S1h6NVFuQ2VuUXZuVVlsMUZiKzNQeE8ydFpqWjY5aDl3YnFpSWtBSmZZOXlJ?=
 =?utf-8?B?dTJObk83UkdrR1FXejdybk1odFlsMFNTK1N6QnkzNDd1UW9hYmg5Zk43R0F6?=
 =?utf-8?B?Z1dYSlYxdVU3K3ZNcHlRN3VWdDBZUUN6RHB0dkx0WHU0d0tOa2dYUG9qL3Nk?=
 =?utf-8?B?Sk1HdHVxZCtneWtWUGMveHVYd0xKeDUzeUxZV2ZGNUFuQmpid1lscXNlcDQx?=
 =?utf-8?B?aHluc2ZWamcrU3lodDNvNEJPOFlYRXpmN1YwQTlraVZNSVR2N2tNakR3SFpt?=
 =?utf-8?Q?tHDHV8OjiDBV5uaRvxexvxr0NQAQTM/8yAFCeStFFNEZm?=
X-MS-Exchange-AntiSpam-MessageData-1: 2hH92NuH9X58Cg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168eb7fd-19e2-405d-f449-08df197dca8d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:20:17.1492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pn+2LNW2pqnNLFTVlNnB6NcAxF+LVv4Wz3KTX5MeeJzJomxowtiBUAamAzp4npzkE4f5aDUZPmhbPTqFPnT/+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6127

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
<...>
> @@ -663,7 +665,7 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> =
Result<M>
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
> -        self.inner.lock().await_msg()
> +        self.inner.lock().await_msg(None)
>      }
> =20
>      /// Logs and consumes every message the GSP has already posted, and =
returns without waiting for
> @@ -685,8 +687,9 @@ pub(crate) fn drain(&self) -> Result {
>  struct CmdqInner<'a> {
>      /// Device this command queue belongs to.
>      dev: &'a device::Device,
> -    /// Current command sequence number.
> -    seq: u32,
> +    /// Next RPC sequence number, advanced once per command, however man=
y messages the command is
> +    /// split into.
> +    rpc_seq: u32,

This renaming of `seq` into `rpc_seq` does not seem to serve any purpose
and introduces a lot of churn.

>      /// Set once a message fails framing validation. Every later receive=
 fails, since
>      /// the bad message cannot be skipped. See "Draining the GSP-to-CPU =
queue" in
>      /// `Documentation/gpu/nova/core/interrupts.rst`.
> @@ -711,7 +714,7 @@ impl CmdqInner<'_> {
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
>      /// Error codes returned by the command initializers are propagated =
as-is.
> -    fn send_single_command<M>(&mut self, command: M) -> Result
> +    fn send_single_command<M>(&mut self, command: M, rpc_seq: u32) -> Re=
sult

Passing `rpc_seq` here looks wrong since we already should have that
data available from `self`. And IIUC it's also easily avoidable by
increasing `self.rpc_seq` *after* the split state handling in
`send_command` (running it in a closure to capture the result if we also
want to increase in case or error).
