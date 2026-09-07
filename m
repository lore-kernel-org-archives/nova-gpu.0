Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B07E2367B5
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 03:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788750827; cv=fail; b=oaNpASU4YC1CxaoFBYDb323lARjw/JN/lKqkSyxnr8Xqy0ZL7eL+TkY6TfeujFkMc948xgDePTNutsRIQd/TAnr+ef2XmNbjjZ+jpIFWAnmre0c+2IBF/K2mWFgaPuMiYEyM2p6oJbeFUxodIzalZKlIz241Ld156PplpU3CJrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788750827; c=relaxed/simple;
	bh=/xosjqIKnr+haW+Yw0p++Y7upR1lNGTNVMlN7ytRDc0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HTNWwG7O1kWWBv97RhBiXvU1FeoLhCFMDiSRaf4tYdbEZLPq1+sWgsY3TjwdjTQEitW9G9B7WrTaoyQ9wJtKfWhBNHE4KWrbi/X95yE9uvECN+pyQ6HFNHma2FF78T33RLajTEHtey05OtEJViskLXc3haR0TPu3JtATDDLVlpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W2UiCPjZ; arc=fail smtp.client-ip=52.101.62.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W2UiCPjZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csbfYpr2f+1lMVQ2ftrbrX9JLW41XhTw0oVs4Zh/GhEgKeIqE/cqDVnHbgpW+fMJB7wg2UqQ42hS9oxVooW84Y0DOAGDG8ul0XIgADtlM5wPWVIwsSDatVbiMZvvJ2s3Zzn6R3q0lrcudm2Gtv78bBVPItVqsgg5glAu4+qmveJOw7lHtyle9WFCJzaoltDT4Sv0t8oA4ebji9rXhvFOLh55yXjApVDcIpFMUJ983AaPUmOyBSnJAgTGOM8M8kUQ6GHMouP41VAiEVGqhs/xKdgigJJrwDTVWfOctyAitEYWYmOy5H8cRCy1OJTg92JZ8a8KVZBD5ml940XBUnixEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XD/adnm5Ezpp8zIyf9uvoCo3SXC6rjQ/3jcnBXVDzg=;
 b=jYG9BE0FwdwYXFZBcRtculqFu4QBogl2WD0NJAW6KXw3iJrulRnrCY7ujET8cG+I86lLyQf1ZoI6DyENYsY1xseONnz9v1GkISt3EOla1N6z7sZCnzdNIVoMbigl57uSvATS2nKdd4aMbK2kqigt6wvidNW5Kv3Z9VSVE8QAMZE2ZfK0UAeweJSLa5OqHa5RoksX499jYtrsMlEYbduVYNvC4ZmM07YzNE8Zq5mVDiM0ziE0KRpNd6DGQlTl4tPEKsPnJMyo89ZXflGHRk7hnjryaRRvzPkX0wLsmA07DulKC1b4AdYw65rrLMK1hW4UyNMYdpZPSZOSWdE0uTt+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XD/adnm5Ezpp8zIyf9uvoCo3SXC6rjQ/3jcnBXVDzg=;
 b=W2UiCPjZT5wOdxGT48/NeislBLuP007jZkav/whohFjI6NPX+hyi7mylrU1yxhQqu+GaQXMBeVDB2dJ3xaF8PUxwTqDSg9/F2uxoHtaxEkMS5qCVXZCefmZR49ixyQ1/a3jSHAddTx4p5Edclh9N8iZkcwILvA8m6S3smuXM0n6CXqT2h7wYq1gZfk6yoZLLlBmdGxdpXFbym0sstP01CAojdv8hwBI6yk3GoYCI4SkKVWqEvCs8r6O6snRIoWEU7tylJAUbt3DlbiCDqCwl2GgmYQl4XgZIgPhn8bbbGzU/gGyNxJfUNIybsG4+g/ia7TMEGYlwidb/6TPs6zYn0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 03:13:42 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 03:13:41 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 12:13:37 +0900
Message-Id: <DL8R8THTD7T4.260VNQOBXRHJM@nvidia.com>
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
Subject: Re: [PATCH v2 03/31] gpu: nova-core: extract radix3 page table into
 its own module
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-4-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::20) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: 9639e7af-3cc7-4924-92ab-08df0c8e04c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	UDxIpx3hjfXaaynnPRXOOdKk9+dCoIRwsUETnLFMOrVWYt1GdwAgxJSZEQ2Ly5tVWbQUuFA/jTjOvHqvrzZhtjFd5SRBx48KnqXYNEIMmz2MsJiltldiRfd1tVb8wAxFXaQ0P8y9nESJUzq0vmA/MExgeVJyAv8d75TLpD7xmgGsIwB5YlALKE5ctaKz5ttyj6+EWCRaaFhM7kcNT6yUjzboXCiX0M5oiqDP8e2M/zuLHHYAcu+/V6gOqGD6OltwefyVp7i2G2Gw0Mmd+ZrdY2zaMq00GcZgJj/D+LkjvUlBOP4fUaESzI5fsZr+iXG0hSK0F5bHfNWPh7bd355X1uf+nm5kTGNOySsDQ89n5f4SCstBFpyaLlJmTPQVf0+5B2IFqV0O47G134mUPAVUDJ+Ee4nC5dv903I9CKIw4XedrgCNwGmk6PubfWsz4Rg0eC1SZMOveRLlrYoSXJC8afSR6gO+3+0N0N4ZnvMKKCrKzvEc5eU+Oo/TVrMss/Y1XoFN9HtvT4XqT/UXTDK63TSAuQ1IAnZnvsLIK9Q01jgsFNxZovvEFsiRR06K77nTDFE7o8yEWQnG6KPZ9OO1huEeb9PUGqpHQ/ClH4WeLyOqveWFRk2ZvZOYjEpMRVzejulJTGW9wJkSboA0vrQjhT5GEqM/HG6L3did9ybUkC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pmRjhCWUt0ekt4WUlpVklmT1htc2d5NEpmRzVNd2JIdXRES2lQd0ZWRWNw?=
 =?utf-8?B?QTVWMVNFb05oWHpHRDdoRnVlTG1Yai8wZEIxcjE5N3RoRXNiV2l3OWNGOHNS?=
 =?utf-8?B?S2k5SXI3ZmRLbXRDMzU3T0pCTm9PUWNjWTRjWmdpdmNRK2YxYkZ2RThzTGZE?=
 =?utf-8?B?dEc0dUVXYnZEbEE2ajFqYXFrTUNYWGZraTRWV01PbnNzNnEraXAyMmhLSllF?=
 =?utf-8?B?QU5CTlQzREM5elh5S2FNVm52Q2d4SGxUNWZMRXJ3WTNRYUozSEUxMEJmU3Fm?=
 =?utf-8?B?VFpzODlueTQwLytYb2R2cFdZeUc4RWQ5VFQ2bnFwaTJqc3Z5YlBaaDdsSkh4?=
 =?utf-8?B?blduL0pLSTMyWEJ2T0x1aVR3UFMyMDdkUHgzOHVBM0tpeFVqUHI3U24zMDhw?=
 =?utf-8?B?TksxUmJ3OGtKUWFvSzc5OENDS0NReG0wdkhKWkN3dnMxZHlDaWxJOTFzVG9r?=
 =?utf-8?B?SzhYMmZvc09sL29CKzhqWXdpdmZyd2ZBcUZaUkdqcWx6MzB5OUpwVDRzR0Np?=
 =?utf-8?B?MEtSY0ltWTd4ZCs5QnNZTXMxL1RWU1lIaWhTMmdOVE9WYkhoOHI0UXd0Nnox?=
 =?utf-8?B?eWdPaVNUVlZkOVNjWHJWd0xOSFJsWjJLdS96SUNDdkh2bFhHWm02Smh1YlZr?=
 =?utf-8?B?ODlMK3puM0FOT1k1RG5ScnRkaXVXVGkzYzFWK0c2eFBSdnU3Q0ZXcXcyUWRh?=
 =?utf-8?B?Y09zYzJVVWx5UGtjTnFSUUJrdmJleFpySDk3SkNJelRvTHVVYlNqM1Z1R2lu?=
 =?utf-8?B?TVl0MW1zaEk2UXB4SnFxdWZqeTBKYUlEaytPTmpOZTNMbjRnL01YMGZMVTA4?=
 =?utf-8?B?SFVNakl2VDRJZ0NPenlIdi9JWDlMK2h4dktIZzk4WitHT0NqaDVXSThsMGhB?=
 =?utf-8?B?VllEWVRUWklKR1JGMkdob2p6dTdEYWpPZmZEMml2TElUV0dOL0VXZDZ0NkVN?=
 =?utf-8?B?VHI5VXROMXNKbmlUN0hRNHkzM3BZOE5tS040Tk5VZitRdG5oMXdEdEVZblVC?=
 =?utf-8?B?WEViSWpZcVE1S1p1K1k2cEhOMFMzMEJFZTNZeFUxbVpXTnNxNDZPdXNPenV4?=
 =?utf-8?B?MFFVVjlqS2pIUVVOZE9mYWFLTTUxOHRVTHZPVHJJQUxWQVFTVFl1UUgxalRj?=
 =?utf-8?B?RzhMdEp1VmJGN3Fyck5UdVk4TUN1eGNkZ0Yxd1dQeVlsckFoQVNaQzlqbkkx?=
 =?utf-8?B?Ym1QTE5xeUhQVWU2S1BwWGdpYklCaTh1QW0zcXBmU2VLL0V0c2JJWWpVRXIr?=
 =?utf-8?B?NjlpS0lpTVJLUlBEcWFtcXhrSEZUczJoRFA2WHVPUms0b2d5dWRZdHRIdUFu?=
 =?utf-8?B?Ukl0VEhFYlJhRXhmamlIS3lETXYrKzRGTGE5dVY1R2ViVnVLUE1xT25PQU9G?=
 =?utf-8?B?ZUxBbndvd0ZkSWcvYjdRRm9jV0Z3ZzNzbFdnd3dPRDVGcjEzK1QzUnFzVUs4?=
 =?utf-8?B?R1REYUlUTUdBT2Z2TXVqMnpFTlRybjJKdlVnVllXdXdRWHRqUFhTejYrTGgy?=
 =?utf-8?B?b240RDJmTTByalJmZ1NjbzZDOGdKdUNBQlBVTnYyZnVJL1BLWHRFd0tOWStq?=
 =?utf-8?B?bkxvQVlDeTkwV3d2WU1KOU9Fa2JjdldEakJ3dW5NRGkzbXhITndsYStyN0RR?=
 =?utf-8?B?bmgwWEM3TkZrd25RM2JBSnRZanE0dGlkOGh1QktEcm9hbEUyTWdBZWE4TEww?=
 =?utf-8?B?TFhSdE5FUGF3NU1sWWRoU091WVZDZGhZcFVOMXpCdHBKbzRVSHIrYStqc1pZ?=
 =?utf-8?B?SVk4VHNlNFkzeHV4cVg5aGZKRmREQlBFaWcyTVhKbHBkT3luazhKV1NrOGll?=
 =?utf-8?B?WE9nZUtqc3BVdzRqakFONkZpTDJkVHpaQUc2TjNJVUJvM2hadXBCOWtlUzA0?=
 =?utf-8?B?dEFhYUJnRHpHVGU4dHNyN1FqdUpKVjhkRk00OEgxaHdDSFNpSVRpNk53cUlp?=
 =?utf-8?B?UnVMOVFRMkt1WlFvczZndWJlQlhVY1p2eUhJaEg5ZDQyTkcyNkwzTkNobWJO?=
 =?utf-8?B?bjRISFhQcGVIMVRnRlgvSnlOR3o1N2pqQm5JeUlidHlhYXFSYzdNNlljS3lk?=
 =?utf-8?B?emJLek9Oc2FMQklxSll6bTYvSjZlK25OM3VOcHJacVY5VFZvZis5MlFyWlJs?=
 =?utf-8?B?VWIxR2R1Nis3WmRpZUsvRDdRMWZTVjN4dnhuck1lOStlM2oySXk4aUNDTUpv?=
 =?utf-8?B?YzhvTE1ZdlRBcmVSRkRNNWNkNFkxWW5pYXBhdHoyT0hOeEdvYUNKNW5JNzZZ?=
 =?utf-8?B?cDBFL0ZDQVZEeEtsZm5MKzIxYzN1ZzRHS1k0RzhtaWhJYmg3ODdDcU5BR2FF?=
 =?utf-8?B?TnBIQjNuQlkzNlRFcXR6d05FMXBuYkNyZFFnMVpJMWpRNUNCRitydG1WUzBl?=
 =?utf-8?Q?XzqKRakKTJOvx8ySYDa6Ak6Hr+BIce4shRJqtRZwew+su?=
X-MS-Exchange-AntiSpam-MessageData-1: 3pa6ymQApA5WNw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9639e7af-3cc7-4924-92ab-08df0c8e04c8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 03:13:41.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKBwBtz1joXgRShn4wv1szlpymuDYsdu7QlCrhr3B25cnEm5qyvKLWlbBfC9Wfw9Ma8T7agluteWuag2AJ/BEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862

On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
<...>
> @@ -26,38 +21,21 @@
>          },
>      },
>      gpu::Chipset,
> -    gsp::GSP_PAGE_SIZE,
>      num::FromSafeCast,
>  };
> =20
>  /// GSP firmware with 3-level radix page tables for the GSP bootloader.
>  ///
> -/// The bootloader expects firmware to be mapped starting at address 0 i=
n GSP's virtual address
> -/// space:
> -///
> -/// ```text
> -/// Level 0:  1 page, 1 entry         -> points to first level 1 page
> -/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 =
page
> -/// Level 2:  Multiple pages/entries  -> each entry points to a firmware=
 page
> -/// ```
> -///
> -/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
>  /// Also known as "Radix3" firmware.
>  #[pin_data]
>  pub(crate) struct GspFirmware {
> -    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table=
.
> -    #[pin]
> -    fw: SGTable<Owned<VVec<u8>>>,
> -    /// Level 2 page table whose entries contain DMA addresses of firmwa=
re pages.
> -    #[pin]
> -    level2: SGTable<Owned<VVec<u8>>>,
> -    /// Level 1 page table whose entries contain DMA addresses of level =
2 pages.
> +    /// The GSP firmware image mapped via a 3-level radix page table.
>      #[pin]
> -    level1: SGTable<Owned<VVec<u8>>>,
> -    /// Level 0 page table (single 4KB page) with one entry: DMA address=
 of first level 1 page.
> -    level0: Coherent<[u64]>,
> -    /// Size in bytes of the firmware contained in [`Self::fw`].
> -    pub(crate) size: usize,
> +    radix3: Radix3,
> +    /// Firmware file path requested from userspace.
> +    pub(crate) fw_path: CString,
> +    /// Firmware version from the TLV metadata.
> +    pub(crate) fw_version: CString,

I was contemplating merging this patch early as it is a reasonable
change on its own, but unfortunately these two introduced (and unused
for now) members prevent me from doing so. They are also not related to
moving the Radix3 code around. Can you introduce them when they are
actually used?

This would allow me to merge this one and patch 6 (which btw is
strangely not placed right after this one, with unrelated changes in
between) early and lighten the series a bit.

I think patch 11 can also go in early, but I refrained from picking it
up now to spare you a conflict upon rebasing this series. Ideally this
one would also have been at the beginning of the series.
