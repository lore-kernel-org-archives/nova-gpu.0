Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DC5CDF1
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 04:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780462187; cv=fail; b=Vlf1/SPJBKFL1m77V/T2UVRar5xMRuXEB9cSq/MYh38BFEIiWuYSjB/8ZZaII4hkq5ZuaqDtqo3yFpOXlVsB73lPfYO2dQQdm0iSNqFgH1VMy18fjOjZs1v3/1RK88y5bR/vLEfnG76ZcUgtw5OAQ1IzXUIOpJ6eU9nEaFJ2Wqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780462187; c=relaxed/simple;
	bh=e89rjCJyEcofVaeRQgb3ew6YAWR8VQgSaV8JjAD26RY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=RyNVeCi8enGd9Adjy6Z+24xMwI0l7wy/J9pc8yE5n6VhqCG+DT+RYRr4ujDu/mfmIOLNZ43kJB5X2eW4aJ0jsEp8dELLTmSfDBxLwXGLzGgQcy/w4D0rD30Pg2q/y4Ti/g+ixeRbVkVLrmBCZH9ZVUV3pOUpmIEH5OUaP7rUu6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZHgy5ZSj; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZHgy5ZSj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4I4coKE2a32TL3O0MS83kVDlkv40O6jm7ZbSpHAtrEnkI+2L27cPUt+fFpk3SCk3Ax+elueKb4T3hQiUrk03GNqT0+x4XwF0CIv7PNruQzVikwMl29JccTkXwkoEDbXW1uPys6XJqciVR3YJN/8N/T5IVk9iQxvVSnMP2JdkyAIET37m2V+AN6s9k578T7l3ZlcCLf3hQGu7LHwl5Qej7uLnF7SMDrlhcBz0l+QMWG2T3iN3gpWXquJrsxLjeJ5xMXyShQUO6sYbJeEOlmjdTVVJzzljMT3jdhIoXDmb50y6HP/ZEDiyaTErcwTlW4lgjTbO7T0WIhtdY0YdKztAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25yDJ+JqV12t3NxEbztu2KEjaWpnDr2sNGF5BsTHbbc=;
 b=bOuxPMCrJeDgqH9+aY0VMk92bkTZH39FEeFb1q3Q/cS3Q2LAxjXo6krGK2a6+p1oPb+F2LEDlvjqzOFxSWm7WFJbW0tbOmXqNXb0QbozWJHDms8RLyHReyeuVTEHBBL8H0nrtAmu131dz3VA6o6EibzoiL8F+DKaxdxBcpt0CX7LdrG1GOPoEJ/ZQhcMveFYjiAvPAjEdACqkvx8h67V9RdH3xl+kX0/lfBoGUDKKxedRS5X7Iu4v9v8cgbqoeXgW4+VQWQttFYaMXNmdSNOoMAZ4+7sLgEVvniFY9h0AFFWcNBREKyMkfkDxRt0+e3FWvKNjkGLBtxMvQrtM11wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25yDJ+JqV12t3NxEbztu2KEjaWpnDr2sNGF5BsTHbbc=;
 b=ZHgy5ZSjDeH7468O0B/sHxxM3D0Hr4FkOMdKU/B46kS6tm1dSrVPgOjFBeP10h5VfI6FiVioPmDxq5ie+IFbCu4DXU5B/8uQa8Nc/ruT9I5l+4BeJeScF+eBBkkVYfRAvW9daSlTueyf/HBmgNW458PWN3OiTjmMsnVDJcwNZ6CKQDO1uSSK80yYNoQ2robJRDutvo2HhcpDHkhSRKNpSw5hmSX0Q5TL87lkkQXqsc/fLL46wg9WQ45EW0cZmB/iugnQNxiqCX4wiEFAsm/aogK5LGEaP1cSg640rGfuGRYyV/NYuemOJ23PmnkeBK6ZBCqqaG0abJOsD+NxU0glSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7991.namprd12.prod.outlook.com (2603:10b6:a03:4d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 04:49:37 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 04:49:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 13:49:33 +0900
Message-Id: <DIZ55YVSFSHX.22380TVS2TUG7@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 15/22] gpu: nova-core: Hopper/Blackwell: add FSP
 message infrastructure
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-16-jhubbard@nvidia.com>
 <DIYK5AGFFHSP.3PVP7YX854KWN@nvidia.com>
 <DIZ10B6ROZYX.JAM563H7Z5LX@nvidia.com>
In-Reply-To: <DIZ10B6ROZYX.JAM563H7Z5LX@nvidia.com>
X-ClientProxiedBy: DS1PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:8:44f::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 059d6855-9631-41bb-213a-08dec12b8371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|22082099003|18002099003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	du5eTcAsjnTSqbVk+Gwgez8nUJ6AyRBf2PTet7MmjP6zvumDzeJHJLLLpS9JQHrnAJvGuWXLbyffvu1HuRcvY9hpWdIlbpDdsMzNmYTg5/o/bLYUxO1BDYKaLun4ERj55f5CTsELhP+cYfDmvFTOt7pnBzuWVnwsb8vldlDryGS0uFX83dn/GQ7iwiJuFSjFJ97nYiu9eA+0M2sg+QBdifBO2C3DpudpNewei0CO6ll4bq1xBEwG2IGTBuSx6SyxwXoft7yMPxedsfS/zJOZRaZmdG/s73u9N4TOa96BaesElPvkuZPVp0+vCBaHxH4EEjpV9difJqAAlvJ5W3SVNw8XUVu7nx7bmo0PeqgVKzJxjvba9crd+OaRRbiefDxuA6pQmxrdTn5AqwouDnuNG/miXKItLZbFc38bisWnoNXPfWm/sQdmK0HslFZyolXAlHAVIWxAbkOdop57XXHfc7ztacPGJ0oRJeHjUO2XFfOyPK++D1427o3X2lv1z3p3nbfnSWDN+TSL8J3H4zGp2dxZf/VRZDy0jwiBH1Zv0TMtDC1HUk5fB4SVxdnfJVVP7vahFd6HNtgCBLJ7lfa7HYAnwLbbfeKUuM3LxPQLva+VE2rkAerBwUULlhbztNfkq413mW15tBECgLbYclclQyQD1k4FAL6blHNas7NxRN4no27kLYBf4zgBEHaYH7Fh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cURpcDFScitlWE54N3JMWXJIVnZ6VDJVSmZSYmE1NHY0UHhLUmRGSlRMMTJF?=
 =?utf-8?B?blJzTEs5aTNpb1R6NzlRZVdmeHJqN3NiSStkQjZETUIrV0hidER2SkpydmtD?=
 =?utf-8?B?Ykx6anJhMFpGRDJtRHZ3OHU3bU90Y2hIaGF1RHBFbjZSelNodENIL01uVkRn?=
 =?utf-8?B?WG0yaGtxQURkZ2Y2NlpQTE95cnZwZmJMNUh5M01zVGo3WUhOU1RpUGhYdlhj?=
 =?utf-8?B?bXorYXcxRWtkTzd1WmNHTVRNU2JzUzZzQW5LSGZlRTk1L3d1bDlYSndUQjMv?=
 =?utf-8?B?N2o1RTVKNXJTVkM0NEk4Q2VpTmlOYnpyRUlFMlJ2TU90emlHMW5SSHZPOHlx?=
 =?utf-8?B?cVdqY1d5d3dnNVNXeHdVQStDdmdOVVY1MHNKazQ5aXBNQmFncmNkclFkMDRP?=
 =?utf-8?B?SVpLVmo0N3lUWXJUR3ZXUDdyMHhEdDdLUjhHV3BHWjhIOUt6dzJnV2Z4RzJQ?=
 =?utf-8?B?SHhERU1VbmVGaWFQUldmekJNWGRvSnpzTjR1czRRSE1GZ25odnFIY0pSSVM2?=
 =?utf-8?B?b2RzQlNtZUpNUC9nZGdOTFFkbStMaFo4bXlVL1Q3Z3d3ZzR6Y1h3NFVNN21q?=
 =?utf-8?B?b3l0SGJPK0dvaGJaMnNLOGUrbm81S3JLd0VGa0hZMlNmaGhXOEY2Ym9nWVVP?=
 =?utf-8?B?RFd2UGFzUkRpZVZ3NzF4MkxpaTJJTE9FZ2x4OVlNSUM5Z2NQVGlGRDAzWVIx?=
 =?utf-8?B?RCtuZWJVYytXMkhFSFQ3bUlZckFCY3ExdWtoL0IzY0laTjhaVHo1SWh4M1Qr?=
 =?utf-8?B?M21PL3R5S2VYUjVHQVc2Z1VLbWhjNXZZWi9qcDRQREw1WVlxdk9PSE1jZEVo?=
 =?utf-8?B?eXIxaG0zOVRpVWxMN2hyQndBdHFWMnJVZzZjQ2lnMDJxZ2lCZ2NHeWEzK0Yr?=
 =?utf-8?B?NTYxNWpzM2VxdzMxYVp3VndlU2hucHNiTXlDS2NxWXNlWlFlYUdibzczTW1K?=
 =?utf-8?B?OWk0aVlqZXdxaXFTL2k0dTBJeWhtN1hrdFdBSEpvdlhwd1VzREYzMGZtNGI0?=
 =?utf-8?B?eVUzVldoWDl1WlUxa004WDFYREdjQ2FSZFNTQkkxYzVGSVBUdEFTWFJWU001?=
 =?utf-8?B?c28zZ2FMb2lYNEZXU1gzZjRXSnVtenIyMEhQL3ZCdlNzQ1UveHRPVjkwK1RO?=
 =?utf-8?B?VU5Na0d6TXUrNXdzS0FFbmxCRHZSV2U3QklveGNTVGhySFhST2ZmLytwd2Mw?=
 =?utf-8?B?Y0l2WmVZL2xkcU5IaVJoaCt5M3ZvTGtqbVFhNlAwcUt6dVYrRStsbGtmMmw5?=
 =?utf-8?B?UGZPbXBXYndyWXRHUW9Ba3prZ3FueUR6MWlQUjh2aVk1YTJnMklyUXVTTm5x?=
 =?utf-8?B?QjVzU3VTVHlPUWxDaDhNL1NKUkl2eWtIZlZVZGtraStLSkwrcXJiNmNUb1Rt?=
 =?utf-8?B?Vk1sTngxWDg4UXRtT0lvd201KzZNY0Q5bGFTWEpMazFWZEIyaERweFEvV3gz?=
 =?utf-8?B?MnV4bnV3SDFHQU5ocVJyMWI2TnNOUnFTY1dQMmc5K2Y5cGFYU2JobGJWQXQy?=
 =?utf-8?B?SDBLeWpaVm1wR3VTY1JKNy9kZ1BPdXAwcHdlMXdYVzZWc290dmw2OVJNMmVI?=
 =?utf-8?B?c2IxT1dOREVKbDZ2MnY4NjFpNFg4YkdoZG9MNVlmS0Iwak41Ym53QnZnV05K?=
 =?utf-8?B?NC90Rk1MM2JqYWhzTDMwQXArdnJudkNoZTdKRVNjMmlTdk5KRmVzeWo5djEx?=
 =?utf-8?B?SVY0YUpDMWZyVUVnNkVNb1hYai9vS0t6RG9yM0pTQ1pycUJKbW9HN3Zwcm1P?=
 =?utf-8?B?Z21KVGJGMnNwbjArS25zdE85MTVMOEpDQnpYSmZYUE5IZDgyNFJWTmNiODFu?=
 =?utf-8?B?aTB0NmdZVEVRbVlCcm1ESTZDWFZiMGVMSW5hZVlnU2ZiNWE5b054Y2ZSUEtE?=
 =?utf-8?B?bXdrV0I1T29BdFBlL1dSTSt1ZWhIWlUwUmJkcEc3V2hKM05mN0hxaHp2R0Jz?=
 =?utf-8?B?U0JUMkE3d0dCVDVNb3FDQ21vMU9uYk5qc2pESStvcGFxc1BlZWFNOWpRSGp3?=
 =?utf-8?B?MHlKS2lMRVJpLzFWWW5DSTdCcTE2ci94WWU3ZFFDYjJVOHM3TEtWUXl4RDFj?=
 =?utf-8?B?UVZ2NGdHdlVUbEsrVWJHdEI2TFdubjd2Q3Y3L0poM2lQa1RtL2V6WEgwKzU2?=
 =?utf-8?B?UkNGRGtyMTZ1SE9zNEJDQVBLZ3kzSTdvYTlFeTZycUcrZVBTcVBFSFBhMWIy?=
 =?utf-8?B?UEdlcG5uQ2hGWkJONTF3S2ZibFVyaU4rQW5FZUZzaDk3MlNPSkZ6QnEyWU5u?=
 =?utf-8?B?TERxOUtMZWVCclZHMXoxcHd3bHpCc2JzY3ZjTkhYSXpjNmRFVkJLdW4yQjZp?=
 =?utf-8?B?OXZub0M1YkxtMUxqam8ya1g0TUlkUlZGLzlFS1VHdTk2Tm9wbkgvcXdrZnd0?=
 =?utf-8?Q?jJkGXyOA4RKgT0VZRfSOyYXSR3sL9GE9eGDfdQnARVILU?=
X-MS-Exchange-AntiSpam-MessageData-1: /gO42xOtbJ6wWA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059d6855-9631-41bb-213a-08dec12b8371
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 04:49:36.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkjKDVBtD+EglvLUfocR229s/sBDQDw0QMvvQKAK7jkqAeTXP6JZF9h3/0zVd5vQMxb6fiCKSC/q80Vdarw9+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7991

On Wed Jun 3, 2026 at 10:34 AM JST, Alexandre Courbot wrote:
> On Tue Jun 2, 2026 at 9:21 PM JST, Eliot Courtney wrote:
>> On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
>>> FSP communication uses a pair of non-circular queues in the FSP
>>> falcon's EMEM, one for messages from the driver to FSP and one for
>>> replies, with the driver polling for response data. Add the queue
>>> registers and the low-level helpers used by the higher-level FSP
>>> message layer.
>>>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/falcon/fsp.rs | 61 ++++++++++++++++++++++++++++-
>>>  drivers/gpu/nova-core/regs.rs       | 21 ++++++++++
>>>  2 files changed, 80 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-cor=
e/falcon/fsp.rs
>>> index 6b057d958115..0ec1c55213bc 100644
>>> --- a/drivers/gpu/nova-core/falcon/fsp.rs
>>> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
>>> @@ -112,7 +112,6 @@ impl Falcon<Fsp> {
>>>      ///
>>>      /// `data` is interpreted as little-endian 32-bit words. Returns `=
EINVAL`
>>>      /// if `offset` or the `data` length is not 4-byte aligned.
>>> -    #[expect(dead_code)]
>>>      fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> =
Result {
>>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>>              return Err(EINVAL);
>>> @@ -131,7 +130,6 @@ fn write_emem(&mut self, bar: &Bar0, offset: u32, d=
ata: &[u8]) -> Result {
>>>      ///
>>>      /// `data` is stored as little-endian 32-bit words. Returns `EINVA=
L` if
>>>      /// `offset` or the `data` length is not 4-byte aligned.
>>> -    #[expect(dead_code)]
>>>      fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) =
-> Result {
>>>          if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
>>>              return Err(EINVAL);
>>> @@ -145,4 +143,63 @@ fn read_emem(&mut self, bar: &Bar0, offset: u32, d=
ata: &mut [u8]) -> Result {
>>> =20
>>>          Ok(())
>>>      }
>>> +
>>> +    /// Poll FSP for incoming data.
>>> +    ///
>>> +    /// Returns the size of available data in bytes, or 0 if no data i=
s available.
>>> +    ///
>>> +    /// The FSP message queue is not circular. Pointers are reset to 0=
 after each
>>> +    /// message exchange, so `tail >=3D head` is always true when data=
 is present.
>>> +    #[expect(dead_code)]
>>> +    pub(crate) fn poll_msgq(&self, bar: &Bar0) -> u32 {
>>> +        let head =3D bar.read(regs::NV_PFSP_MSGQ_HEAD).address();
>>> +        let tail =3D bar.read(regs::NV_PFSP_MSGQ_TAIL).address();
>>> +
>>> +        if head =3D=3D tail {
>>> +            return 0;
>>> +        }
>>> +
>>> +        // TAIL points at last DWORD written, so add 4 to get total si=
ze
>>> +        tail.saturating_sub(head) + 4
>>> +    }
>>
>> In a later patch, `send_sync_fsp` polls this then calls `recv_msg`. But,
>> structurally it's possible to pass in any size to `recv_msg` and read
>> more than we are supposed to. What about having `recv_msg` do the
>> polling to get the size and return a KVec with the read out data,
>> instead of `send_sync_fsp`? `poll_msgq` could stay private and we can
>> make it public later if we need to.
>
> The issue I see with returning a `KVec` is that it imposes a dynamic
> allocation for every message. Granted, this is what the current code
> does, but now that we have this `&mut self` logic in place that
> guarantees exclusive access, we can also turn the receiving `KVec` into
> a member of `Fsp` and keep passing it as a mut reference to avoid that.

I don't have a strong opinion here, but is having a dynamic allocation
for every message an issue here? AFAICT, this is called once during
boot. But by having Falcon<Fsp> decide the allocation we make it
structurally impossible to provide a wrongly sized output buffer, and
remove the need for the caller to separately poll, even though all it
wants to do now is wait for the next message whatever size it is. What
do we gain by delegating the polling and allocation to the caller?

Anyway I don't really mind, I am just trying improve my understanding
of the conventions for how much we try to avoid allocation in the
kernel.
