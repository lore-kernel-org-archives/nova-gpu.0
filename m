Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99624402BA6
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702551; cv=fail; b=lvGkj8Fg+lS5VU7ol/jtPfnJkMS33cssKNBfRDXJ4wZPJ4Uphz+h+7T3yZIFobFP8mcBipFuHTLagoOCAMAnyr2ZM7n3b+yJy4G5PBC+QklSnCMSbC7fLo+dZt/5mswmN1TuCqeSzE409v0SBd3bJieUSOf03gaX018eX1fUdyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702551; c=relaxed/simple;
	bh=rH7bY6E2LJFS/KytkniyVZQJXczIixIcN+wi427IxjE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=JunOrRhPyFyhoBmpvZ5IlIjXAdNDnRhgof4VZX1VpscjkMS3DSa2BuQh0Fr2u0Luj1UcF7XDqoRlV6k0qCkGBNKhGSODtYCYS+LI8NtKfelG+hx2GFqWvQCoDbmQHELKgww8y9v8zx7WqE0IMxoU9PkksV7ZWu+2Eens+hM7ZR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAGIT03X; arc=fail smtp.client-ip=52.101.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAGIT03X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLI0DugBbx9nzyzK8E8nEXSgpNOj5F0nIlx8NwvyfXMqMQt/ahXG6AnGvB8rCpf4BcH09koFlteh+pGGdMFtP5kFq9s+T74FKBWIPdItfdDP1kAvf/nDKiQwQ6ECGdgMCTBpqSGQ6Eu+SOk8YMmaks68/n9dDlA+oJTuGIVosdHBZT0w7VueZDw5Npt2FbybL49cTGPQjckq7VSGPdiSEQLrbhgPIpRr4d4hlMKc1Bi9eY64mEjF8iXT96z+t6yvIaFOpwp3DH8GssEJdXlSzLVDrQPGL6itt/a5ICnrUeIaDdF0dQ8G4qYhkQsgYfWkBEf8pDFXyOEKatHW9/n0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=604FDifeulCxucWjgcadmhxSkV9StvD2XE7+qyNuH7I=;
 b=iUKBvCXzViXYefz5Yzm23BzLKiIifk+Bzq94JO1q1GpSVyA/Vzazxw4z4ou8bsvTZIA2RBYr0noC8UFHJ7yMQLAKD7teJ896o+5A+7TsPektYgnnbnq0WGriyQ6ZDo3A6UzH7150mT0PC8fEwQx5Gp32VEKlATA/G6IJIq2o4pvdX6aEvveOQqorUFF8SMWNDm4eEbV8QiKU3qSb+b9fG8kss8tCJdhFzKRvSBFm+6ChsjzFclTK6iLUEZoKKzsgwjK4e/8KhE6TjXYTdAz3REPtk65VFh6IOaon6cNhnVKkd7mm8lKKZTlVfyjzKUz39dZOHeNoUl4kjH4CEHNvrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=604FDifeulCxucWjgcadmhxSkV9StvD2XE7+qyNuH7I=;
 b=RAGIT03XCngy+/S7pBRNmi8kcsJU/bzZbJz2ILU3i0yoFMeUU5BW6c7u3aLe++rRUAv/ejlwVDJBqILcyvg3Unqn3gXP1PP13g5MOZTQTUDxA/z9U8W5Nvb5TtOZQYODoGSDTbQop6pxT3dkLpa7bnlKYvUHC7SHSPhQaSMl992OzTXoh28isExIqrpfJtTXHp//yQUZNZTDWIcNwKVbZ1hmzzXI8p/pLAfjTd3qE9kyCI+t/4MgfTEro9wWNz1wNjmED7jBmMHpMUO03knB6Jy+IzItSiJ+EMTL/TQySf9fDC7R5LgS17dmfhknsnGNMlvPCI4K9HsZS38FYOM9CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6727.namprd12.prod.outlook.com (2603:10b6:806:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 13:22:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 13:22:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 22:22:09 +0900
Message-Id: <DJBCU2JTZ5MY.2811IADA4ZG8E@nvidia.com>
Subject: Re: [PATCH 6/9] gpu: nova-core: consolidate GSP boot parameters
 into GspBootContext
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-7-zhiw@nvidia.com>
 <DJAJAKA0TXSG.C1AYAKDAWC11@nvidia.com>
In-Reply-To: <DJAJAKA0TXSG.C1AYAKDAWC11@nvidia.com>
X-ClientProxiedBy: OS0PR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: fc515474-434b-4785-0c34-08decc7371c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|7416014|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	A/uMYPsNB1n+vqBArE8waZEqs0nuEG9yZP4eoFzBEI2CRN5CdVkU64/Y0BDUmfgtNWA3W4N8KKLpw88ougvYFL0T925TFNoeOH7g8wMDljVrulJrpFOdWC9rH2wz0FpeC0FvuUvpkQXZJh67cezdhobSDTYuvJWfOp/DTL3d5/o3kAdOWioa8HCJMPx7ghV+Jx9kdO6d3if2N5yppQc40VyUyPEjExXN0TxBwIoFv/QOx3qbVt0MshHt/AxOlua2ZH/NIQd7sttRKRCHxF3mfSnm2xzosMfvD32ljhK0z/uIfH8NcfdE55MHpfDxI4pyhByKJgib+0kzrnxYYBi6bU2CWFJlWHQgatn6xvQ0zWPSwJHB+jFF6d3fAL5yxvRRdfjfPiT+u017j1qtGNBU/0Un8Y6NYmmtVpXJVFMBhYszljhMjcbwW8+RoMyrwRcOUlkvnJbZfzxL1dv/lk+iNjTQgOnvoa++XrMPgDIGUKhgxuYcB1nhb3yrqAa8Kn9w1WugujaPziT+9nxZNJ6kBPwDqsM4p8N7phqKziQw0v6gQuoGb4lfeVJJ0AJw9kakf5emp8uAHdHCGzcMG8ubRgckBhwSTOKdI4IZ44mD8dY5wV7fBV6+Lg4IpYz7uHUqqLlmXE36ld+1w2sfPR8DHj+AWUxUjoYlYjPGVcRMDgnj9VLt+KD+KVklV7Vk6Fhs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(7416014)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEVURGRtWHl6eXRsT0VZcE1mQzIzS0w5ZFhSVHhaTlF3SlJzR0pVZTRTVnZB?=
 =?utf-8?B?RHJuRTZBR05PYkNBaWlXQ1QwWGw0VXNvQi9RZkd2ZWgzeWZQaHFSaXZjMDdq?=
 =?utf-8?B?OENLQithZnJJVGt2VFhUdXF5aEJVblVpSktFeUtRZlY3cHE5SmFkQUhjR0s4?=
 =?utf-8?B?SUI3R2U2OTZvVWxNRGs3cFJZMzduQkFHcEZaUWVVUTZnWkhjeGJRZnZuZTEr?=
 =?utf-8?B?VXJvU2lOK1Y3M3BmN3hWTHJwYUdwUUVVU0c2Z2VkZ0ljODdDZTNvbXJwL0hQ?=
 =?utf-8?B?K21ZU2M1ZlM5STRKWUQ2VFdwWkE1VTlpRTlSM21vTVluRzhrRUJqVzN5RDln?=
 =?utf-8?B?eTRWRkx4d2NHbVpqdk03bmsyUjd5WThMWWQxQytYVE80bE9GbU9HcGVOTFJD?=
 =?utf-8?B?aTlwVmQ3bTBYUjhIVk85Z0NhMEc2R2JQMEh1RHdIWnh2ZUhKRS9Pd0YvZjdr?=
 =?utf-8?B?Tmp0QUNIYUtqVTRkVkdSQkNrVzh2cE9rWUlmTkNlL1NDbjZ3dXlWUUIzNTZD?=
 =?utf-8?B?ZnBqem83YmRNQXNVcm51cGd2Y3FPcS90R1dWc3RjUzJEYjFwKzkxL2o5djk4?=
 =?utf-8?B?MHNVWGNWZTkwNWh3VFk3VUpSTURyaDBwNzNCbXQxM09URUgxY2t6VllBa0xm?=
 =?utf-8?B?VjB5TnBSRWJtTDlNeWRUVXhEa2NYZVdoZFg4VmJDekNxeVBVNFBBbExhNk9L?=
 =?utf-8?B?bDVxNndlNnNOU2g5NGZDTFRiY0h1eVFpNU81RWJzcXYvVFJ1OG1UMEFaMTd6?=
 =?utf-8?B?Q2h4M3grZitwYXJ6RHpHYnMyajBwQkhsZzFqTXhzUjJhbUpVUnQvV3J6K1hN?=
 =?utf-8?B?ZWFNVC91d01FNkcvZkRNVENMU3VrZjNhNVVOQTFEQ0lxdUl2K0NYL2VEQlVu?=
 =?utf-8?B?RllJV1JEeDlweVBJaFVlMUM5QWthV1czSVVXaXhwZVhRNlo1b0dmMnZJSDhz?=
 =?utf-8?B?QWJlZHlhT25IdEUvQlRjMGp0VE1BSm0yM0FPV3Z3akYyb3E1V0VyMWYrdFhr?=
 =?utf-8?B?anJtMllsRk5TRHlTSkhhbkk2TDJZOE9VU3MvNlVIRFlhRlo2TU15M1VjUmF0?=
 =?utf-8?B?cjFoT29VOEk4eW03V0M4YkdiQ1AraHRuS016VXAraGREbDdHc2pxK3RQSHJ2?=
 =?utf-8?B?eW5qVHpZYW1XWU03SVBRUlpIcnQ2UWtnN3Z1VkVoVzlraXRKZXdlTkpxQ1FD?=
 =?utf-8?B?Wk42VDNPTUU5YXVGMWhvSGhFL0MzNmNTVXhtaWh1L24zUlZ6RTNiTDNOeE5M?=
 =?utf-8?B?UmxBL2NOVTVhd1ZMZlIzdDBsazFCWThVelUxU1EyZ281TGk1L2NTeUVocmcx?=
 =?utf-8?B?V1RtS0hkN3B2T2N4cG1BRmF2VEVLZTZwOXNIUTYxamQ0bWlmajg3Z1NZQlUw?=
 =?utf-8?B?Q1BCYVRaZmhoUEkxMFAzRk9EV3RwUDZzUm1WOWltU1U2RnBpUUhCamIxQXZm?=
 =?utf-8?B?SUtoaXlrT290TWlJaC9PdjBDMi80SU11c1p2Z1dmaElsUllxYmNHU25BaTNS?=
 =?utf-8?B?V2lkZEtrMENkUS9TcE5oMEUyL3hFc1M1WG5YWnY3MjJDOU94NHkwOXpuODJw?=
 =?utf-8?B?aVdnM1VKSkcxUXI5ajd3YzhtNStKTHFSbFRlYm0zRC9PWVhSd1RaazZYUmpH?=
 =?utf-8?B?VUNpOHZja0dHK1hoTmE2ZUFHVFJBL1RkYlo0SXVtdHRmcmhPNU9la1I0K1Fz?=
 =?utf-8?B?anN4amFtUmdMUVVSTUJXdHpXZy9KeUxGK3YwT0xUWFdocDJ6bmlqRDVWdkI4?=
 =?utf-8?B?eDZYVG93bU5uU3IxQ2JpenhXbFZabzdMRXg0VGdSdTJrZEswNkhwMmxuV2xU?=
 =?utf-8?B?WnlBSDBsNmxIWlJvY0lPSm9pMlNBSnYyTnZFREVGcldNTUpMQ09jN0dScEpz?=
 =?utf-8?B?MTZHak52aWg0Z0UwOHZYU1F4MVVEd3FoeHdUVG9XdkZQVUJvTTNFbTAzeGNq?=
 =?utf-8?B?ZHRydkhPMDBvMzg1Ym5uNzFiVnRtVXdtdVVmQjYwZmZkdzJjTEdIMEJTSU1L?=
 =?utf-8?B?aXp3R0lWdFFHNHlQd29QRm93cVpXeTRhL0w0TUVjbzRReCt1YWszc3I4UDh5?=
 =?utf-8?B?VW5PR3l5d29zbDR4MUV3Qm9JMXJyL1IxWG9DcVN5VDdBVDVsQ2VaL0pFSWUx?=
 =?utf-8?B?MVdIbWFuUy9leDUybGp1TWRqMWZINzJHZkxoWDhxeVRvS1M1SDI5KzhqSSt6?=
 =?utf-8?B?TGxVdEpKSFhaZTFtZHYrcXRKN1pWaGdFalFqU2NyYjgxdjZCQlh0NDQ3KzNQ?=
 =?utf-8?B?TVI1bnRGQWNZL3pINW9nb0hzWFQzdmFjdG11aTVJTVdZbUtSR3ZBRkZ4UStV?=
 =?utf-8?B?RG95ZjRSRnhTczZUYWx3QTdlakNERHliWEJwNDBrUUZpc2JnUndlNnNpL3Uv?=
 =?utf-8?Q?j4QvD/yI9O+yN/Gay5gcqhhDuwE2ekS/UADGrlo0YPfWW?=
X-MS-Exchange-AntiSpam-MessageData-1: vsblMdSYTV+glQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc515474-434b-4785-0c34-08decc7371c7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:22:13.6927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XA8pyddT8RpieoRc5L/UdLgyvHwB36LfWXsP8ty1QavSp7/EEByvktluj5Au+pmAlVwKlm4xW82cR8XkYVKN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6727

On Tue Jun 16, 2026 at 11:13 PM JST, Alexandre Courbot wrote:
> On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
>> The GspHal trait methods boot() and post_boot() accept a long list of
>> individual parameters (dev, bar, chipset, gsp_falcon, sec2_falcon) that
>> are threaded through the entire GSP boot call chain. This makes the
>> signatures unwieldy and difficult to extend as new boot-time context
>> (e.g. vGPU state) is introduced.
>>
>> Introduce a GspBootContext struct that bundles the common boot
>> parameters into a single object, and refactor the GspHal trait to accept
>> &GspBootContext instead of individual arguments. The struct also exposes
>> a dev() helper with proper lifetime annotation so that HAL
>> implementations can extract the device reference without reborrowing
>> constraints.
>>
>> Update both TU102 and GH100 HAL implementations to extract their
>> required parameters from the context struct, and simplify the call sites
>> in Gsp::boot() accordingly.
>>
>> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs           | 14 ++++++-
>>  drivers/gpu/nova-core/gsp.rs           | 22 +++++++++++
>>  drivers/gpu/nova-core/gsp/boot.rs      | 55 ++++++++++++--------------
>>  drivers/gpu/nova-core/gsp/hal.rs       | 23 +++--------
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 14 ++++---
>>  drivers/gpu/nova-core/gsp/hal/tu102.rs | 31 ++++++---------
>>  6 files changed, 85 insertions(+), 74 deletions(-)
>
> I think this one is also good to take independently, it groups all the
> context required for booting the GSP in a dedicated type, which is
> something we might want to do as the SEC2 and FSP paths require
> different resources (and thus could use different associated types).
>
> So I'm leaning towards merging this early as it is independent from the
> preceding patches in the series and makes the first step in that
> direction.

Merged into drm-rust-next, thanks! With two minor edits:

    [acourbot: pass `GspBootContext` by value to `Gsp::boot`.]             =
                                                                      =E2=
=94=82

So the boot context can be modified by `Gsp::boot` if needed (although
that shouldn't be necessary, but it is more natural to pass by value
here regardless).

    [acourbot: deconstruct `GspBootContext` in `Gsp::boot` to simplify diff=
.]  =20

To stay consistent with what was done in the HALs. This also makes the
diff considerably smaller and easier to parse.
