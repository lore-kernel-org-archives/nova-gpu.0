Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB53248867
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788749473; cv=fail; b=fAygAiUERD3h9/meIf8MR2PbNKu2BaphZHNPIDq6GW8J9aRQRUCPcBD54QcLU2O4CNXBeEMC1L7l/ebTaIkXUdB+GKt+1ivnt6kxNHSh48Zl+puIMxBDb+8+RYKItodnAohv69jTejtRu/6mJhL73iz5UkzzQSS6JN+pfeNwUWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788749473; c=relaxed/simple;
	bh=vF7z1lVdocGclECsUxhW0Orq1eCE4Et3IdUxu2WvtVQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cc2SgZ2b1FUVGeWgPRYXQiFiM03gNrP4SSsJDpnh3WAvJ1mNgG3fwmYHDcILT/c5VyuqhJhWbKBUF6GNrbhYriBjxSjz1ZNJfvzrPCw07gYxCfT0Mmqg2GAaahYhGxrrDe/q8D01gYaRHqXI8VXPBqW3RnG3ZmwdhSRRvoXoL2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oRDnb9ot; arc=fail smtp.client-ip=52.101.53.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oRDnb9ot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK0q3oNm9DYdfWewTnNH1E+WtNWkMpD/3HH2xucxZvY/qAoWLh1PxSmuW16a0akwIpJfidwH4qsXrO952iTHTfBYOVQxw4kgS597uiY/rfWdgs60e8tdo/mVw9/ZJUhblm1Ej9i6UFm7hw+Gf562zroEbOHETzRoody4NGxq6UvTM2hVvRmec5aam69tAQbJ1l7A1sQNFHN41HL23knGpNI2+BWyA3IBfAbJOdAFxZ9D9psKzGOvODddzQYT33I3+4wuGdBr+8aHHoHUK1pMxA2IbFG4IFy4mLJ9CN/FDz5I2+l4EWBoH+SMEiMs6i4tX1FhV6+eTQM9vKh+vWQ+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlkj13SLztfMVass1OVtDDOE07rb3DLPiRLzG+XLzhU=;
 b=fILNniaeHEbmTo7rNMYV+BZm7tJLDLBMaM9gXzdCTT8cPd2TwEt3d+tJU4I3t1fP3SOVGhu+Cy1g6m2Bq4ogYgGYywNI8EujRuqrn8O5+Tnu5/G1b5mPVjitF2aAS20/rgwD1QskYaFiDTqzGcjAc9FbYbcL0wPCX+uiJZQBfn7SnQvxXXYjZEjjzm31hlv20EaQL36qUJy/tYDi9DEgRjgwG+EfS+VuNSoglNzL6yLJcmXkhECkh+WjfPHO7oWMHM9XwXXxgaNS1uh9+oIbNTQEKRPep+oBRKv1qMpt2bVuCPej428TLsXn3IwHSl8zkeUjxWcUO9R0BnojxCljdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlkj13SLztfMVass1OVtDDOE07rb3DLPiRLzG+XLzhU=;
 b=oRDnb9otgSaozzHszq4hlqmLVJsavyv5KhH463+815+RwSDDFOacba7M1A9e5E7/c9Na6k6T1IOoMGOWctIRKaF+mKyie2lLf32BJHdNktHoH8dnqrauLqhTHYY9OaXDmi99jsKUPI1dsbCXhmFt6E0Br3lKz1kzZpFqM/6+lOrsuy0c06fIAYpjKJvW/yJDOws/jP/m2j+v7rd3DfEUPLARgzucWRqdnDiLzM+pC64gQ+NjCfWcrHiRqU9Orf1OjESVRVvuV4sdccfG8auZyIJO/EJoHhmz5KwfnHU3sReeRpHmXAJoUiLWUZ8mfHC6IfpcBvwUZl/DRAbWlIuliQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH6PR12MB944609.namprd12.prod.outlook.com (2603:10b6:510:3de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 02:51:07 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 02:51:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 11:51:04 +0900
Message-Id: <DL8QRJJ1DIEP.1F6RLHTRQS1AL@nvidia.com>
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
Subject: Re: [PATCH v2 07/31] gpu: nova-core: distinguish async GSP RPC
 traffic in debug logs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-8-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-8-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0253.jpnprd01.prod.outlook.com
 (2603:1096:604:24b::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH6PR12MB944609:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab049ca-a589-42fd-3cfb-08df0c8add59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	w3zH0GMa5B/rmIeATZHHFhhFYtRKiyDj+k4zK9de4uPBB57aYgtsrqcUnQ/Ixl7IySBihukxjYnsa2ipgrS5orr9YK/v9NycCjPpj2l9gPj5SPj0ap6Z9/7VuWLZ6wMjtzSwddPQfRr78jjSAlraZb9z2TGfbRSVlazDHyiVRqQBB9lmH5ITmJepCoS3CqVg2uqKup+NFmp7xsqKQ69tvqNSLCcpazMfFHmV2bIE8w3CNIDI29ZPs6pB4C/hV6kboiAe8EPw9AIBFf7bHW8oL0Ks1NSM7lnNOHjC7y2XUa2soFs+aW+5EXkp2yD9qbytbH9lhcals61SSDqlRNZMNN2LOLLYG5ZqS02dh0Oz9fvl+KaqN6L//egErRk33GWeh0gxiPLmlNgYinX8VGJavw3mfkzVXDFTnCumY4em4FxK9V+YKKQvC4ebWdrFDrJPPOLIghcS2gsFTAqM2kfrFBo4MhgqodXlOiVZGx/RzcJr8xmB6M1N74BOspnLXPVEloKskSDRNNaM/wUUgN+9CYY5zfn7wVyC4EgsoaDvGW8iqdZyfZKT3X7o9u0eqxw7R589M92YubbjscNF/msMQmGawUcoSYgIFyqndP2bLJWBcQKG+mBesMfos+PfOIThVo52nKbAra1EtzIubZwHx3QSKfy1UfHq+3wngeL/F8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3hoYTdaM1ZhdFFLeHVzSEVkd2xaZXdzckJSMEQvRW1sL0x1MmVCR2pZdWwv?=
 =?utf-8?B?Sm1ybEZwenZEYUh2RHJhVS9KQlJOYTRPdG5aQ0t3eXRDbThMd2VHY25DRS9W?=
 =?utf-8?B?S01Dd1ZGa3BFSkN6YitmMHREVUp0dmdQampGRG96OXNqbStROE9GMTZiYTlQ?=
 =?utf-8?B?K0VwT0JmT0xza0pCWjdhVXJkTlJ5VlByY29YcE5wRmNmT3pjc2VnQ1FYcnZ0?=
 =?utf-8?B?OTZvcEhtcFV3bEt0SzQrakZHMGxlTEFvNlp3ZjlzN2huc0krYnZnNTIvT1BB?=
 =?utf-8?B?OGpkWEs0c2QxUFR4dWt0NHUxQjBSSUZZTmN0aFZFanFySHZtNjhkSmR1Ym9i?=
 =?utf-8?B?SGhJMEt1S1dpeWx4cHAyZ2NITmp1cVRQNUNVMWxEb1gvQXZ0L0VyOE4rVnVo?=
 =?utf-8?B?Q2xNYm1aRTB0UUZHTVJqSlE1UldWY3hsTUZjalFZa3Z3MXRFWW4ya1hBSDNa?=
 =?utf-8?B?YkFBNzk1RzlkM1RGdzBnY09jaHRMUnRhNWR6Y2N5NmFiRnM3ZGRZOGJyZGF3?=
 =?utf-8?B?NjZtZzhYSy9jcXlDNjVmZ2VkQ1ZuZHFJOC9wSE1DcC9yTGNmOU9zVVNueitW?=
 =?utf-8?B?Rjh1SENtSjg5YWZRSFJXNVAyQ2xqVXBEL3BGWmIzeUQrVHo5TUZkbzNucndl?=
 =?utf-8?B?NkpJbXJiaTEwVnRxcHY4V1dSbDgrNGRCaWRCSmxiR2RiUDJqRlVGTE5kUXE5?=
 =?utf-8?B?eHRkbHdzUjlmQ1FFS044QmtqYjAvSmt6eWpuNWdpSWx4TnRVQ3VqN25YV212?=
 =?utf-8?B?R3JEODFMdUl4d05Fckk4QTBVSzZCT0ZKQTBhQWNnZkxkL0d0NlJ3dFFscEJL?=
 =?utf-8?B?VjhtVi82cmlGUlg5cWhtSnlpS0xWeDY3YldxdDJ4c1BRTEp1YkpxYXpJTGc2?=
 =?utf-8?B?Rmc3dzlaOVd6YlFBV1ZoOVdEeFlneFZ4dHRoUjZwMUVKcE4wMFVXWG9QRzFl?=
 =?utf-8?B?MVVTejF4blVuQkw1UGhjRHhGYUJxaCtjZFVDQm9qRERaM3lMRmhEWVhmWXo5?=
 =?utf-8?B?aG5LUXZsT2pPdENYNjVlRm5mNXpkcDNpWDFEcERuUk9MR1VkN2trbHVaekhL?=
 =?utf-8?B?dDVPbzNLSnlxdjM5ODJieGlPYmJrYk1FamZrOHpyREV1VVNOSHl0dXlKVndN?=
 =?utf-8?B?K3lhUFBOM1JaN0U5WFplV2M5WWdBWlI3anlDQS9uQk90MmM4eE15a0VwTDJE?=
 =?utf-8?B?ZExvTXEzWHBiYmlMRnYrTjdBOWkvbzhYMi9hQmZaZW5VWlRibjRZMWU1T3p5?=
 =?utf-8?B?WmVPMEZTVU83WEE0NEZ2eDBFcEYrcGhIMTV5Smovdll1SmxLRzY0K3hZOUlE?=
 =?utf-8?B?aSt0U043NTlpMW1aTUNTZENKdEtyNENSb002elFMUk14SkpQQVE4NzFRdUNl?=
 =?utf-8?B?ZmNna2R0L3hYSXgyaE0rZEViMUtPcHpIT0hqb3lMdkZqSGg2ZFFYSmJjK2Za?=
 =?utf-8?B?cEhUV1pKQU40TnRrc1ZSb1dGNzBudU5uUnhIcVVsRm11ck5yRGtMRFErUlFF?=
 =?utf-8?B?Sk5kSFlDbkorOFFZendUQWtVbHlEZSsrZFRXTXdseUVHdTl0NzlQVDhlRDhu?=
 =?utf-8?B?ZGN3TFIwaFFsQmlVenZPN3BDT043cnZaN3hLYzJzYkhncy9PVjNyR2YwQVk1?=
 =?utf-8?B?YWFBbVdUekpEL2ttQjU5TTVrTWJwZmVjaW5Cbm9ITTljcEdsdnNpdkkxTDBM?=
 =?utf-8?B?MnMyZUd0dnRtalZMbVJmcmtCR1NlSWo5TFh2WXdkdW9vM3pCMEJmaERyQXo1?=
 =?utf-8?B?TW53VHRiMFVHbEFTdllBTGhrRmd6NFRZUVBiZG5KUjgzZHNIblV4R2NCbjE0?=
 =?utf-8?B?THBuazkrY0ErNS9DOUdlYXhhMFFJV055UGVsZFlieVRLWDk0MzRIdHdxUFEr?=
 =?utf-8?B?TXlxbjZUaURwYVBzUHMzZWx0WmxiTmgzSnNDL3g3K0tyeVdtYTZUZHBzc1J1?=
 =?utf-8?B?eWxDdFRiYTBFcDlSTzJhVTJNcUh3OUdOaVExSEtSaEwwdFFURzJvcm04cDJ6?=
 =?utf-8?B?dEZ2T0drRGZTb0RvN3hMTGFzbE5NSE1nY0VldTEwTG9pSjNFRWpJcDFCUENo?=
 =?utf-8?B?TC9tVzRMWUJ4KzdHM1AzQTNMOUd0VEpkWjZtRWt5bVJxcFczb3llZnhYa3pD?=
 =?utf-8?B?d0dya1Q4OFlyZy93eW9nS1BrTUNZdld1K0dMOUR0MWZYbTlKd0ZpL3VFUXJS?=
 =?utf-8?B?TSt4UDgybm1mVlVpT2ZDdUhuckVSR0Nkb05TcThxNTZXZ0hoUEowZm1mb1Yr?=
 =?utf-8?B?ZVJYRktNZ3BBQUd6UFFodzJHNWZqdUJXQVBQSTV0R3B5djhGZ2VHSkZZckc4?=
 =?utf-8?B?ZTFhWHRIaHR1NkowUjNzS3cwdFl2Y2FraEEyWk1NdytpVnlESCtERFFqcVhR?=
 =?utf-8?Q?yEt0VjC5LC9CbvJcvx1hB2inwz6KNKcAIjp+EfZDATEeo?=
X-MS-Exchange-AntiSpam-MessageData-1: MMvnFaemJ699nQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab049ca-a589-42fd-3cfb-08df0c8add59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 02:51:07.0155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qANxeQRuGRVsnIbg8flOtGt+9FyS39eCbkPHOybFN4iMu+n+4JEQk77ZfEg7sakmFirobjw9AYE5aav2LfOgtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB944609

On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
> The receive path logged every message at the transport layer and did not
> distinguish events from command replies. Async sends shared the RPC
> sequence with waited-for commands, and GSP-initiated events arrived
> with that field unset.
>
> Print a distinct debug line for async send, sync send, event, and
> command reply. Number async sends and events with driver-local counters,
> which wrap rather than trap, since they only number log lines.
>
> IS_ASYNC selects only the send log line. Every command still carries the
> next RPC sequence on the wire.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs             | 111 ++++++++++++++----
>  .../gpu/nova-core/gsp/cmdq/continuation.rs    |   1 +
>  drivers/gpu/nova-core/gsp/commands.rs         |   2 +
>  drivers/gpu/nova-core/gsp/fw.rs               |  19 +++
>  4 files changed, 107 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index ac3e6642031a..1eeef2120b6e 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -87,6 +87,12 @@ pub(crate) trait CommandToGsp {
>      /// Function identifying this command to the GSP.
>      const FUNCTION: MsgFunction;
> =20
> +    /// Classifies the send-side debug log as an async send.
> +    ///
> +    /// Default is `false`. Set this only on commands that are sent with=
out waiting for a reply. A
> +    /// [`NoReply`] continuation of a waited-for command stays `false`.
> +    const IS_ASYNC: bool =3D false;
> +
>      /// Type generated by [`CommandToGsp::init`], to be written into the=
 command queue buffer.
>      type Command: FromBytes + AsBytes;
> =20
> @@ -528,6 +534,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>=
) -> impl PinInit<Self, Err
>                      gsp_mem,
>                      elem_seq: 0,
>                      rpc_seq: 0,
> +                    tx_async_seq: 0,
> +                    rx_event_seq: 0,
>                      poisoned: Cell::new(false),
>                  }),
>              }))
> @@ -672,6 +680,12 @@ struct CmdqInner {
>      /// [`CmdqInner::receive_msg`] match that reply to the awaiting comm=
and. Advances once per
>      /// logical command.
>      rpc_seq: u32,
> +    /// Debug-log sequence for async sends. Those commands do not wait f=
or a reply, so this
> +    /// counter is the number printed in the send log.
> +    tx_async_seq: u32,
> +    /// Debug-log sequence for GSP-initiated events. The GSP leaves the =
RPC sequence unset on
> +    /// those messages, so the driver numbers them itself.
> +    rx_event_seq: u32,

What do these counters give us concretely? I don't understand how they
are useful for debugging since we already have sequence numbers for the
commands.

>      /// Set once a message with corrupt framing or a bad checksum is see=
n. Such a message has an
>      /// untrusted length, so the queue cannot be advanced past it, and e=
very later receive fails
>      /// until the queue is torn down and reset.
> @@ -738,13 +752,24 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>,=
 command: M, rpc_seq: u32) ->
>                  dst.contents.1,
>              ])));
> =20
> -        dev_dbg!(
> -            &self.dev,
> -            "GSP RPC: send: seq# {}, function=3D{:?}, length=3D0x{:x}\n"=
,
> -            rpc_seq,
> -            M::FUNCTION,
> -            dst.header.length(),
> -        );
> +        if M::IS_ASYNC {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: async send: seq# {}, function=3D{:?}, length=
=3D0x{:x}\n",
> +                self.tx_async_seq,
> +                M::FUNCTION,
> +                dst.header.length(),
> +            );
> +            self.tx_async_seq =3D self.tx_async_seq.wrapping_add(1);
> +        } else {
> +            dev_dbg!(
> +                &self.dev,
> +                "GSP RPC: send: seq# {}, function=3D{:?}, length=3D0x{:x=
}\n",
> +                rpc_seq,
> +                M::FUNCTION,
> +                dst.header.length(),
> +            );
> +        }

These two `dev_dbg!` statements are almost identical, can we
differentiate the relevant part with a custom string and `fmt!`?

<...>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 61fe93db9e7e..d5575c036eb9 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -52,6 +52,7 @@ pub(crate) fn new(pdev: &'a pci::Device<device::Bound>,=
 chipset: Chipset) -> Sel
> =20
>  impl<'a> CommandToGsp for SetSystemInfo<'a> {
>      const FUNCTION: MsgFunction =3D MsgFunction::GspSetSystemInfo;
> +    const IS_ASYNC: bool =3D true;
>      type Command =3D fw::commands::GspSetSystemInfo;
>      type Reply =3D NoReply;
>      type InitError =3D Error;
> @@ -122,6 +123,7 @@ pub(crate) fn new(vgpu_state: VgpuState) -> Result<Se=
lf> {
> =20
>  impl CommandToGsp for SetRegistry {
>      const FUNCTION: MsgFunction =3D MsgFunction::SetRegistry;
> +    const IS_ASYNC: bool =3D true;
>      type Command =3D fw::commands::PackedRegistryTable;
>      type Reply =3D NoReply;
>      type InitError =3D Infallible;

Async commands are effectively removed by the end of this series, so I'd
question the need to add this distinction here. This looks to me like
this patch should come *after* the switch to r000 to make sure that all
of its premises still hold.

So unless there is a strong need for it I'd wager it is best to drop
this patch for now as it looks more like a drive-by feature than a
preliminary need for r000 support.

> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index d3678f16750a..857d53c77297 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -359,6 +359,25 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>      }
>  }
> =20
> +impl MsgFunction {
> +    /// Returns true if this is a GSP-initiated async event (`NV_VGPU_MS=
G_EVENT_*`), as opposed to
> +    /// a command response (`NV_VGPU_MSG_FUNCTION_*`).
> +    pub(crate) fn is_event(&self) -> bool {
> +        matches!(
> +            self,
> +            Self::GspInitDone
> +                | Self::GspRunCpuSequencer
> +                | Self::PostEvent
> +                | Self::RcTriggered
> +                | Self::MmuFaultQueued
> +                | Self::OsErrorLog
> +                | Self::GspPostNoCat
> +                | Self::GspLockdownNotice
> +                | Self::UcodeLibOsPrint //
> +        )
> +    }
> +}

There is a `NV_VGPU_MSG_EVENT_FIRST_EVENT` value in the bindings that
can be used to classify events without resorting to an exhaustive and
error-prone list.
