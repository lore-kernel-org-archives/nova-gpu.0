Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010060.outbound.protection.outlook.com [52.101.61.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082B23B05BF
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152828; cv=fail; b=DlqyNLZtcHjoPiH14FR86euaiXV/D9QeAT/qteQuyDc+/bzpWma8Man3b7G0SEzPUX/edb9bPTzHAS2cVuwKpj+pA3saRFWOQByuI074b2TSHHzDx4aLIzJ04jwUfRh1Y3e3gw4qbvjIz3AH3CjaXkFyd3WDYY9BPreKx0Ag788=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152828; c=relaxed/simple;
	bh=gKQ3zH1iuFhMBvrCQhcquvQN4MtDmfRBU3Z8ZIWJops=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=hl7fQ7O5AoJBQbsuRBtzo7TmYKstVEPyKSGVFaVfmWEcScr5h3I6jj2s4rWGDJ1AJ2767KQ+vjpUX2r3owjKZVHsStzUJ8w8qdfixfrkU0uhKfnhl1+bWK8UCpKGuSOUE8vh9asOmvBL6JcgNR9+xvf7tNGD1WoR7OCTh48RyZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iiBPwmHv; arc=fail smtp.client-ip=52.101.61.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iiBPwmHv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRRXIEdGELvmOg2Uvnj2bUoikY1lvw0d74ZpuLrzD0UHa97SFNhyZLhqnYIPgY25KLh+r/iZRHUG8IAO2kkX6a9beYZGNa7Q0tisuzjd2Uqudvlsb1z0Hby0e3ORfvPoWghbJiZ4pD2aguxTyD8eQK3FV/IR25GAaeSM27Jd20MEC99hAgcH3dFs+h5h/CeGyXPdOyFPleynDwGPhie3a1M0or6EyVnlwjitKDw32f50ikkSnL5V9jTQPtdmbV7RkDb+Bn5tJQ4S8Ke3+Pfs7DtatCYkw3IgIoVGojNqPTQm/YPwnTLfLzVww9w4Js6C9CRYT4ZU1KXtPISbrg7C3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yUmjQyciAWW9k2eQIbawASxpSLzMgW9ie/UTu7ptZE=;
 b=UH0TZdpRdSGA/A+G4IFsGNVFS3BHHoGMkbpweeWES47Uioz5iPlCW3Yx0YQRDsLA+lrYwwztueLhZNTX87VF7BiXl2UufoTyKC1OTLHqq+DhCI9s/+n36w1F/YRUXkhycom+BUo3lc4ueUmO/7Wilz4l8u1mGH5REfCoFaKAPLA3lF6QQlaef4GB6LVt7YN1VyCY/8UdptTjy6PCQ9S4AHmGDDUxiOl9wxKippWr/0otzXJ6l+wO9ThZRW+eOov9cl+SjVZ9xvYQFJ+C5p9fmXlfszGzQTGHIpoft79gFIt7Tl4asY5JsqzPu5Sl488ObWMFq4zxjUWEs/BPChXptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yUmjQyciAWW9k2eQIbawASxpSLzMgW9ie/UTu7ptZE=;
 b=iiBPwmHv2U9pzE7Dr0Crzx60IVHD7wsqMdlLAqhQAf7TYGB21+ypD+aaHfk0b9CLFKeG4LmkNSE2Lys+uSKnTu6lw+LRD4K82wCEXtyjyhxj5BmfxRO6C9C2JB0vxkHwQezp2DldBNdqSzCfIT98/dAu4gMJu8R/NEMTqOzV09LhoDbYbLeMhFlH4xDHPbqlTmSUNWBgDrEu7wzsHU4oxeTPV0q2dU4ikrfkAjH3rstlHRqdjT372gqDskrhcxGT8kfu1bJgxR7F8XLyOYsSfzu9JBwha1ggqQJze+A/YGGE7y9cBmZPeB1rPNLC9pBOoOKV91+TQT8hNThpCNRrzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:07:03 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:07:03 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 14:06:59 +0900
Message-Id: <DL2V9T0YINMS.F1BKR8WX5T8H@nvidia.com>
Subject: Re: [PATCH v2 08/15] gpu: nova-core: dispatch GSP events instead of
 discarding them
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-13-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-13-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: fb183f1c-3568-4f22-b2a5-08df071db1b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5RRkBv+tO5MIrhU1Xt2n84KR3fMsufB5WM5O0+x3Yad5gbQ2+SUyY+XftpSn2MP1H/zqTsA4JOgnk2yPKZT+yuF2NuufnVCyYtlwJTRIPbg7NO+0XujScLaXpmJHj8FSBd7B9mnBebIgbzc1jhF4EZg48M3+2Iyj86oismR3UewwzpQe7ig6epgDJla9dcIRgNzjkdxf4WrCOh7k4yLmWgNQn7tTIpZckeZkQM7rnI2iM+cifg72Ap1YP2PmmTCZjdAAppHCkEPly2E7x1LN98zWBiH6q6muWpz+alXjBNaEOZDzmxrAla8suFC2BgzcyMOq9Ezvl2V2KHzpoevqBXC+R9qtF395Lauo3GCyAwbsmyRY3PXcxkq00jEPOAXvD8x0DVphocBsu/RJCVkkr+HfKXJHzMHK+IunKwQRGqF2UfdIK8sHslSyv9dqZUSJru30Ezi2oPUWw9V2sMfBI0zOvYpk3DvOkqRUIx3gbnwTdBB6sr/ZrPy1e+tWHxqKNetNAXNDHZl4G2ejiKFQIsatu8rEGYdJaIE7QOqFXR07BsZbnMOs6G42Zbl1fTGo4HTXDtsW1xGSWaia5MqVsXHl+1NZnPy298z0yaMZQiqjx6e8RtfXDIjG86OZr/etYs5+mjMyLrO1j3I0OLNMEQVvv7vAYX5fQBMZCeNZ66g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJMVGtENlV5b2Rtczd2eEJTUktONFlFVTM1T05ia25qNzFncWl1ZE93SEY2?=
 =?utf-8?B?OWtBYWRWenpCSmM2WVFLZndhMXdtcEQvWWJBL0w3K1ZUT1J6ME5RSG9kLzBj?=
 =?utf-8?B?NXVvcThkZHdZbVdaRXlKQ04rYk9hTkY4RHNxOSsyMUczQWtqVGw3N0d5MWl5?=
 =?utf-8?B?L20vWm1Wc3Vqak00WVF3S2FWMUxabGFnZFhoTGVlcDVoVjFXc3VVOVdIME04?=
 =?utf-8?B?djJHVllRaXNIMDhiZDlLRmJNQkFOaXFjbUZITjJtZVhTeGhYeFBKTGZBdzBT?=
 =?utf-8?B?d2NFR05aaUxhaFRkeG9zclBmMEJXTWdJMUJKTHdDVHpxU2N2NVF4bXlTcCtv?=
 =?utf-8?B?MDZVRkJOTkg1YmtMZ3V4amF1am00R2ZWdGp1aFVBQW5mQXA3SUpDbjBSbWMr?=
 =?utf-8?B?VVNvNEtJejRUdVk1eCszN1k5WkpaVEthdy9FMGQ0WC9tQWxUUVNtSXAzdnNU?=
 =?utf-8?B?L1BaTFc2ZjVUZEFHUzRnYzU4OURDK0ZQcjdvVnlJcEdVcGQxdmE5cnI0Nmt4?=
 =?utf-8?B?YVRDR2VqdzF2ZktKa2JqbEVZN00vSThmTFE4VmNVMmhVT1hoWDJUT3FIQzJq?=
 =?utf-8?B?RlNOSVJXV1VtL0s4TEpTanNtNE16SWl4eUpwdURHZVlxTldHL3c5N1EzSHBK?=
 =?utf-8?B?cTJHdnZVSm1JejRJRUtxVGY4ZXYvKytiNXRIR29Jam5VYit3QnpRdGZaVEt0?=
 =?utf-8?B?eHFnbE1RNFpUQm9MSGtxTWZCd3pTWXZURGw0Y2pJdGZlWWtFQ3hqN2w5b3RF?=
 =?utf-8?B?N3p6NEp2RzZTQ0h4Mm5kK0NQMWdHNVFTQUdCRVpweXc5VDZXWFRsb3ErcWdG?=
 =?utf-8?B?cFIxS2lUNnBpbDIvNmViOS9LblM1V2lRNTlmZDVwNjdWMUM2MEtVcURvYVV2?=
 =?utf-8?B?cEJSdnFSanlOWk16RFR2OHFCdEpyVU0wTTk1cnVIOG1hb25nb0lNL1IrRGhi?=
 =?utf-8?B?RnJqYXBhVnFCREs0dzNlMWR4dk1YckxiM1NGaTF0WTk3SERTTUp6NTlGWXpE?=
 =?utf-8?B?Y1ltTm8yWmF4c1RIdUtqb0c5UlVlRldKK200cXJIa0czbXdIaCtNcFdQYkV0?=
 =?utf-8?B?QVBpc0FPK21tdkNpTWhML0NxV21KbmpmTmtOaVdsL2xaTUE4TDNKTXZWV1Vh?=
 =?utf-8?B?RkNlY1ZjSk45eWNxcTVvbitkYnhWcXFrc2t0R2ZMWUZSTkJxN0pETHlFOUd2?=
 =?utf-8?B?T3lySWtPK2dWZHpiL0plOUdoRkJzempVcXlDVjhzVEU0UEx6eGdFYy9Ick1T?=
 =?utf-8?B?ZjNpVjRBOExVb0l1Y203QXBIMXpuYStpZXBrZkdNcjBEVUhEckpLUjNMa25J?=
 =?utf-8?B?dmlRZEdQU3Q4YU95M3R3V1lFZTVrSExoVE5vYVF4VlhiaEFGOXFIdVNEUkpX?=
 =?utf-8?B?ai9MSG0xSHFqVVhzd1NpUXR6RlZVYjZPOVc3T1hkaExhQ29YK3pYNHNwY3dU?=
 =?utf-8?B?V3ljMlBHYkRhWUFMWXdDQXY1RmVJOEduSVhwMnlaUlpnUHJNVk5uM0tFaWNY?=
 =?utf-8?B?Tk9tRzI1bTY3ai9NaHJyUDVSbUlSWmUvU3k2MmI0MTB3Z2tOVkpYcFlJemc5?=
 =?utf-8?B?dXdPUnc1c3ZYRDFjYzVNeDYrT0xzNGdDbFFmMUZtbVI0bTR4NjRlODRYSDM2?=
 =?utf-8?B?S2I1bko4YVMvWldKWkYrUlU5TkttWlJyeHNkRHN5SmRwVThzbnpyWTU5UDlp?=
 =?utf-8?B?Mk1vckVnUFNtSTNLK3daa0wyMFduVE1kbnowU2R6aVdGTHQzVlhXOWt1M3Y2?=
 =?utf-8?B?b2F5dGtoaGZmeDFCNXFKUmNPVTVNT3FvdFhra1ZNUkN2Z3R2c0VpbnJHdTg3?=
 =?utf-8?B?WitkUGkxcFJySE5ONzBYQlN5bE5DMm5PU0UzTjFSK3ZObWg1dVBiUUlaU083?=
 =?utf-8?B?T1Vaa1FyK1JHVi9uVW45N3BaY1FpVmZZd3c3RkVBRnlmaWUvR1FhRDRTNmh0?=
 =?utf-8?B?UHdkalA4cVk2Q1hNRFJlSDJvVFNZMk5WdmRqSC9TM0FXSWM0a3l2TThhK3k1?=
 =?utf-8?B?azRTRG5wOVNnY3lZd2dFeHV5cndXNkJBQU9WNWthUVQ0b1J1MVFtRHJoaVZV?=
 =?utf-8?B?dFlDbHBvcW1odWpJT1ZXNitQNWZkcUIwZzdKc1NNZEs4aFRWMVl5L3JOOHpK?=
 =?utf-8?B?V2hJVmNZVUw1a1E3ZG8rYWl0cFh6b0xSOGJ1cWJMRjhqbzR6dC9YZHAvTERV?=
 =?utf-8?B?Nit5dEJIZUpTTEliRlpmNDQ4L3FhZEFWM1c0SzFGL3diVG9WTVVnWFNSWkdW?=
 =?utf-8?B?eHBGNGFuSElhWjVsaDl5bGFjLzZudTFhMXMvMnNWcTFNOWJ6T0Nya21oNjF6?=
 =?utf-8?B?M3dsL0VQMUZGRTdXZCtWK0NYSmF6MU9qbk1RUmxSbzExN3VHTmFGSE5pWDVo?=
 =?utf-8?Q?Wqnywrne8S7Ik12VGK1EpfhlaczB8DcuZLNBpCMZvZhcw?=
X-MS-Exchange-AntiSpam-MessageData-1: 3EOLe/XM8u2TRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb183f1c-3568-4f22-b2a5-08df071db1b4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:07:02.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOM3H0/Ibx/X4fuqcRO6+rmhKRPPiJ5ie1aEHdf+cpsKZF2DKnXxUtvtBHS8MSxTsDTtG5dPW6Y1Eqaz2pHNDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> The GSP posts unsolicited messages onto the same queue that carries
> command replies: logs, OS error and robust-channel records, and
> lifecycle notices.
>
> Anything that was not the reply a caller awaited was discarded, and an
> unrecognized function code aborted the in-flight command, so the GSP's
> error reports never reached the log.
>
> Route every non-reply message to a dispatcher, which logs the error
> records and leaves the in-flight command waiting for its reply. The
> dispatch runs on the existing command and wait loops, so events are
> handled during normal operation before any interrupt exists. Event
> payloads, such as XID numbers and log contents, are not decoded.

The naming looks a bit misleading to me - `dispatch_event` doesn't
really dispatch anything, it logs or ignores what is passed to it. If we
plan on implementing a real dispatch mechanism in the future I'm ok with
keeping the name, but we should document that intent in its doccomment.

>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 64 ++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index f0f28b6ded7a..0df52df1da89 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -547,11 +547,11 @@ fn notify_gsp(bar: Bar0<'_>) {
> =20
>      /// Sends `command` to the GSP and waits for the reply.
>      ///
> -    /// Messages with non-matching function codes are silently consumed =
until the expected reply
> -    /// arrives.
> +    /// A message read while waiting that is not the reply goes to
> +    /// [`CmdqInner::dispatch_event`].

`CmdqInner` is an internal private type and an implementation detail, we
shouldn't reference it in public documentation. Let's say something like
"A message read while waiting that is logged if it is an error record,
and ignored otherwise".

>      ///
> -    /// The queue is locked for the entire send+receive cycle to ensure =
that no other command can
> -    /// be interleaved.
> +    /// The queue is locked for the entire send+receive cycle, so no oth=
er command can be
> +    /// interleaved.

nit: is this hunk necessary?

>      ///
>      /// # Errors
>      ///
> @@ -805,8 +805,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<Gsp=
Message<'_>> {
> =20
>      /// Receive a message from the GSP.
>      ///
> -    /// The expected message type is specified using the `M` generic par=
ameter. If the pending
> -    /// message has a different function code, `ERANGE` is returned and =
the message is consumed.
> +    /// The expected message type is specified using the `M` generic par=
ameter. A message whose
> +    /// function code matches is decoded and returned. Any other message=
, whether its function code
> +    /// is a different one or is unrecognized, goes to [`Self::dispatch_=
event`] and `ERANGE` is
> +    /// returned.
>      ///
>      /// The read pointer is always advanced past the message, regardless=
 of whether it matched.
>      ///
> @@ -815,8 +817,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspM=
essage<'_>> {
>      /// - `ETIMEDOUT` if `timeout` has elapsed before any message become=
s available.
>      /// - `EIO` if there was some inconsistency (e.g. message shorter th=
an advertised) on the
>      ///   message queue.
> -    /// - `EINVAL` if the function code of the message was not recognize=
d.
> -    /// - `ERANGE` if the message had a recognized but non-matching func=
tion code.
> +    /// - `ERANGE` if the message was not the awaited reply.
>      ///
>      /// Error codes returned by [`MessageFromGsp::read`] are propagated =
as-is.
>      fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resu=
lt<M>
> @@ -825,11 +826,13 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeou=
t: Delta) -> Result<M>
>          Error: From<M::InitError>,
>      {
>          let message =3D self.wait_for_msg(timeout)?;
> -        let function =3D message.header.function().map_err(|_| EINVAL)?;
> +        let function =3D message.header.function();
> +        let seq =3D message.header.sequence();
> +        let matched =3D matches!(function, Ok(f) if f =3D=3D M::FUNCTION=
);
> =20
> -        // Extract the message. Store the result as we want to advance t=
he read pointer even in
> -        // case of failure.
> -        let result =3D if function =3D=3D M::FUNCTION {
> +        // Bind the result rather than returning early. The read pointer=
 must advance past this
> +        // message on every path.

Oooh nice catch, the queue was irreversibly unusable after an unknown
message is received on the previous code.

> +        let result =3D if matched {
>              let (cmd, contents_1) =3D M::Message::from_bytes_prefix(mess=
age.contents.0).ok_or(EIO)?;
>              let mut sbuffer =3D SBufferIter::new_reader([contents_1, mes=
sage.contents.1]);
> =20
> @@ -840,7 +843,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout:=
 Delta) -> Result<M>
>                          dev_warn!(
>                              &self.dev,
>                              "GSP message {:?} has unprocessed data\n",
> -                            function
> +                            M::FUNCTION
>                          );
>                      }
>                  })
> @@ -853,6 +856,41 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout=
: Delta) -> Result<M>
>              message.header.length().div_ceil(GSP_PAGE_SIZE),
>          )?);
> =20
> +        if !matched {
> +            self.dispatch_event(function, seq);
> +        }

We already have an `else` branch for the `if matched` statement above,
you can move this block there and avoid testing again.

It's also arguably (slightly) better since the message is now logged
before the fallible `u32::try_from` is called.

> +
>          result
>      }
> +
> +    /// Routes a GSP message that is not the reply a caller is waiting f=
or.
> +    ///
> +    /// GSP-reported errors are logged at error level and unrecognized f=
unction codes at warning
> +    /// level. Every other known function code is consumed without a log=
 line, because the RPC
> +    /// receive trace in [`Self::wait_for_msg`] already records its arri=
val.
> +    fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u3=
2) {

That's where we could describe the intent to turn this into an actual
dispatcher if we plan to do so in the future. Otherwise, something like
`classify_event` is probably a more fit name.
