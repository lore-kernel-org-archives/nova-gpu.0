Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F11E3093CB
	for <nova-gpu@lists.linux.dev>; Fri, 12 Jun 2026 23:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781306861; cv=fail; b=snf12aRW1khvW3Eru4vLqNOhOtCeHyBnl3LXX4DrcAJHYVuZHtvlz2n6T3hldNXlWZLIeTITkpswu8jdTSVnxBSFDnyMLxXesWZ4XZdGmqtkEp5r+BqkBv9wnZi4NxFJK9QRCkHGj2YzXxSoUDeJ0MTw7W4ADdW4uhZ0Q7DF8wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781306861; c=relaxed/simple;
	bh=eIenwP2iefWKIPF9mUfYGYAWAO+tgo3+liYkM3Sp6tg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=T5kEFtRpn+3wGMsyj+rdZU3J/991/y+l9AimCU2a/8qo4nKhEuYFlL27eSEdKe9cDBc+s+ozHv+w5OCAnSYLAn7g4/Buhmf6yx51TIxmsQhVz/t2wnn6wr7nVFn3X0RXD6qYWAMIiHJts+S1jBppPmoPIM2439PGchSuIt4kI0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rP7z2283; arc=fail smtp.client-ip=52.101.62.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rP7z2283"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmFfPeCG/2FpWyM7dGxN1wDAcv5I9FhY+lSZxrMvsZ8q5v4Qnla8+zDgH5xKr8+Ff0YR2RLSEAXkp2yj9zmbbqpjk3ZXwFvIcO5rSUmNplw6dHpuTaBk77Gfn46v4Rnyxm+Qm/wiCAsGL8y5GZdKB3tYfu+DLXfD/Mg2V+0QOb/LSXXQUr0alNOjUNcGzHMLP23nJ+apZHjoS0cc9F07y1qTjQ9SWsamesRQngLMtmy3JSez7/9bi86QMQd5m9eep2EDss32nUx83NOWd8hNuwrMtH4OpYcNIvgpPZY4J4Nwu8TZrsttfAa4KQCSnakfq/XWm0U+CLzimO0jfuLxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTUp/RbUhGIFJRS9OMMhIKwJYuCl84ZZTs73KNFQQV8=;
 b=kym8toN8Z3uTqALSjv1MuwSrHdyuDQlDSqauLQgseYywOWszB3iCLIsSob0VnQWYzYKMWNDAyW+lzFWeWTZwn0eHC1LjobpOaCQ0P3DqZGQOk5CIF4U4mS+XGVXUb2hL0Y9XGzoLdlwYZ0mYMrMUIR+lUMXdWXrJ3sicg6MIok6eUu0cqtHYkIls/PLK2qI5dknu6gZPcEqmRwUaRdN2y+M5S52SguXO47I1LTmOHxl8jG4rmNG7SJTlb98gxt3ZWG08hfU6/RyuRdro6xRN0yuPSf8ScnwHGoQSU+x/IA2MqRfgDCOAmC4H51NIqV1vP+XsDnMIegS29rKADW5MMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTUp/RbUhGIFJRS9OMMhIKwJYuCl84ZZTs73KNFQQV8=;
 b=rP7z2283LShN54m79OXQN7xxs/mKh2M6Ba+g/PbEXztXDTjiQc4pNOiH5EhYCaa0M/Dq2ms/wi3DDmhwZ/MQeiy4YVdNYgds35EqbYWlz8bQkKQKPRUlC30OOTEWFbFwt2d+NHFw/dNRXVzSSb0Mimhst4SHaDFDaXeVc6ob0MMgJyXaLn0bWAa0qdecrf8af2skE//5Fdbu93pS1Q0bPzxA3DN2TikRMaUU13d8epWxE/wvKxKzMjiMcu+zmybnojAMkoAsUbrTo4FXtAbK8rO3bvN3W89pm8Hh7q8Oa+yb/RQZ3ZtLK6auEUOda/5HyqGjQJkarwEunQF8euoIAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 23:27:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 23:27:33 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Jun 2026 08:27:28 +0900
Message-Id: <DJ7GKT7LBOS3.13GU1WMZKQHDC@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Zhi Wang" <zhiw@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/8] gpu: nova-core: add TLV parser for firmware files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-4-ttabi@nvidia.com>
 <DJ75HKIOTSNB.2TVN5UO6XIVW9@nvidia.com>
 <23480c16b36fdb659021153c356bdb61424308a1.camel@nvidia.com>
In-Reply-To: <23480c16b36fdb659021153c356bdb61424308a1.camel@nvidia.com>
X-ClientProxiedBy: TY4P301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a99c24-526b-493f-e66e-08dec8da2db9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|376014|366016|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jM67Zg0HxM5p63LkdcfdPLtrEM7s8KRIDtZoHlxekSO4T/znLY6x7wmLg5WbpTnpf1kshpUFaCS6bb9S3sC9ySPPCogAWQGdsIqukFjDjGMVrhV4Or/HhgjZC45Tr9qTCbu3BUFBPVQsj9EA4r4wKTYzCT+9AwG4vzrXrlEcH977abA+h3dc7cYt8JkdAYF3lDQocuTk5sFzWUv1IpEbnUw5s3PHlPVo7mpUcswMr196h8clDqEQdRNaJhJeCVkKaKavvOxwTI/e371lt30z6fVtT+fs6b8R99AdKc4ACZ27jSNnSHX1Ym58+DFmumrwHalbDDc1elPWY5NUAXjL6SafFBd2I1327xkLDuOwlKqU2UTuuHkwLrtGC2wIaIv16iM4lqLVFDorhyqqlX+wZs0zNgiMnN3DBGIKZCKlzU9MbusBs2Wj0rA4cdeVUzjrrbAT3id3jfrbJsmriNZHfp0ylCaNP+jj/7y/uwdylNR4/Tbz/hkBCGAFHMlF8+PWpIoCauUQLJUK9aUYa6Ro3ePsXZbCf6nZ6GHpLU0akeWkMzIY+giVRd/DLQx/3x9Rhjg6Sb1a8pbUJFFuOv/KSmW3KIYegqosXge1lQStYMnftgtu0YMe8T/2DDo7eKMyUbIC8Ml7RBlH4X9yIsFrfi3lev/wQmCY7niokTuIFBD/lEKRG4P8fkfWatCcYVO2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(376014)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmdnQ01UdW13bDlTVURySWNtWFBmenZPZ1AyU2FJcHJtTkVUN0RRQjltVjlx?=
 =?utf-8?B?ZE80ODB0MmZ0ckxBUFl2RlRTS0hnTFBBd1htc1k5NjlPK2xHT3RBTTB5QkRU?=
 =?utf-8?B?aGRleFlkQlcweFFLMWgrWW90ZndINElRY2JkekFXOVJOOVpVUEFUTUtTM3d5?=
 =?utf-8?B?VFJNV2tneG1keWhyWFdNaEo4cG56Yk1hUGFjOUhVWndYWFFuV0ppRTRLRE0y?=
 =?utf-8?B?M2htcFB5OTZ1WUFObFlVV0xKK0NnQlBGcGNUekE5WFVxcUJpQTNZUnFoMWlD?=
 =?utf-8?B?dFdDb0JwSmJtdkNsQ24wS2psQ2lSaHRWOFVBMzhGbkxJR1N2Yk5RZ2FaZWFp?=
 =?utf-8?B?RzZlWFFUYVNIdWtFRkVoS0JQWkRxU1NWSVdmUXN6aGFyKzdRdFJJeFFxR2ZD?=
 =?utf-8?B?dEttQ2lwc3FSeG9wYkxoU3pzOTlCSXZDVlVkSGJXWENMemc5dzVnR0ZnMmtM?=
 =?utf-8?B?SVhpZTNhVHk4SjhhSUlpLzJBWGtLbzNxTTBkNEpSVG5icUJOaFNkZmFLN0dh?=
 =?utf-8?B?M1pCbm02S1NLQmg4VmkzSmxOUEkvYm53bVRiM0NFVCs5QnFHVUI4Z2hKY0R2?=
 =?utf-8?B?Ty9iQTNWUUxySEJzVHNhZVZOSjR6eTk2VjdTZmhkLzdJZmwwdm5VVmZFZTB0?=
 =?utf-8?B?TnNUa1AzaEl2V3VYaStCYWFSNjVEQUdQczlUOU44YVF1N2o3NTN4TXlUdHBM?=
 =?utf-8?B?L09DWktQSVh4Q3lMZDdpcXFYUTNvSFJpcnlIbVNKZlNidnVtUG41amY3bnd0?=
 =?utf-8?B?Q0QzWFBpMkVkNXYvaWFMR013d3VSNEFEU3lDenVwTUxqSWVXWmdGaEowV0w4?=
 =?utf-8?B?TGpqYnpoczErL2VWazZZR254ayt0ellFdWlZL3dqMkN1MlZJWU5xc2hPZ1lI?=
 =?utf-8?B?YlRmeVM1VTV5cEhNRVZiOTBzSVZNOTF6WXhUR2dDR1lPZVRlaW0rTWlQaG5s?=
 =?utf-8?B?NWp5WXNDR0hNSlkwazlMSm9aV3QxYU84UkVHd3g3VVR2VWl4SjByS2JieU16?=
 =?utf-8?B?QlJaZ0EvNGk0UGhxQ0FpcHVlN2FEV09iNEhmT1F6S3UyT25EWGd2K1MwSHhu?=
 =?utf-8?B?M00yMy90aStacGRVNjNzSk5MUXlEalNjK05NWmFvYzZySmVUYzBTQW96eC9o?=
 =?utf-8?B?azRFQ2RzSWFwVk9yOFVzbDhMdkhtSUpvTitKY2x6YlVRMHdZZmtLRlNPQTBx?=
 =?utf-8?B?aVRCY3Rud2VQMUZrTDdPS0IrYlcwR2syT0ozdC9WWWxHVU5La0w1bmFrMHdG?=
 =?utf-8?B?OFIyOTB3TUNHTTV2OGc5OWR3WDNaZXIzNnRWT2dPWmN6U0k0ZXhyVHNRWUQw?=
 =?utf-8?B?UWxxbmMwWUwvVVBXK3pUTDVxMEROeWdYQzEwMnNWekZJamN2Z1puWjVVVjBo?=
 =?utf-8?B?OERhU0VkWGpaRXNySnhmdnlxR2xuQjhnTjE3VTdQbDh1dnB1YkxjSDR3bncw?=
 =?utf-8?B?VXJsNXRKREJsazRzY2RTdk12VmFseDYyVHdzc3pyeUk2WmF4VE9VRW4zZ3Vo?=
 =?utf-8?B?RzF5UHFhRnhvZDd6YThEclV2bnltWmVRazB3U05BU2xtSU1sZEthTmV0ejg3?=
 =?utf-8?B?VzArNnZ2UUlYSnFVTkVCdFNMdDJ3aklONElGN05VaTUzelRTUDRDZnZHNVRK?=
 =?utf-8?B?bUxrV3JheUFFTFFzZEw2QSsvRUhQWTRzcEdvMmRkb3ltaVloY1BSb2M3WUdG?=
 =?utf-8?B?ZTAzSU4yZW5xK3QwMDdvRU81aTV6eFpRVE5FRGhSUEJSVzRJenpQNTFFbUJN?=
 =?utf-8?B?ZSt2cFpqZ3cyY1ZqanFxZ3p3NjVkV2tERC84MHBZeEhhT2liaEZmdGZIaC9R?=
 =?utf-8?B?L2VHQTBUZm1QOEd4MFFweklXVzQ3clJJbitKeU96Skp3RkM5YUovOVFrWWo5?=
 =?utf-8?B?TWFwbjl4Wm5RSnV4OVcwMXBueFp2V3doYkNpNTRyREY3RnU5Ty85SEFYOU01?=
 =?utf-8?B?NTM2RUM1Um9WYVV2c21BcjZ0ZFdrZk1LWCsyVWtZa2lpemJaQklLUGYvMDYy?=
 =?utf-8?B?RHZHVGd4UWs3UC9hUG1Rdko5OHBZelZ5Sy8xTDdZS2Z2eDhaY0tnVDlWQzNX?=
 =?utf-8?B?MlhVNEZmdTB3NGcvT2ZVR3g2cnVaaU9NaE1DWUNzNXVWWlg5L3ZkU1lvWkFu?=
 =?utf-8?B?aG9haUpoTFZ0c2t1NjlrQkpJVDRSdzhmbmQwWUlKWW5aR0FvUGYxRGdSM3BW?=
 =?utf-8?B?VFN6SEJaWmJmWGQwZkVDTWh1ZGNEcjR6bklZaTFDYVp3YU93VzNtMnIxNFJv?=
 =?utf-8?B?TVJGV0dSRVJ2UHIzL0VHa2hlYkxOVXdyTUZaTWU0OUlVT0Y1cVYvcFZESjRx?=
 =?utf-8?B?VmUxVnZ5S3pPK0dETUFBOUhuZ3FyRXhDUytGVjM5ZXM0Q25ZTkc5YXZhK1p4?=
 =?utf-8?Q?bs8WfWz/eY7Sa2mHu85wXznsThVzeanG8VYrbbJX54Pik?=
X-MS-Exchange-AntiSpam-MessageData-1: ozrli6nvlv+aJw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a99c24-526b-493f-e66e-08dec8da2db9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 23:27:33.2836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtvGbpPm7khVaGf5T1XH7fOGdNULiqyN9IoFI7csASxm3ZImrz9tk0uqkC9P5BFWDDi8wyndZ5Db3qCNAyi5yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430

On Sat Jun 13, 2026 at 3:04 AM JST, Timur Tabi wrote:
<...>
>> > +
>> > +``BLOB`` (bytes)
>> > +=C2=A0=C2=A0=C2=A0 If the firmware microcode binary is stored in the =
TLV, this tag contains
>> > +=C2=A0=C2=A0=C2=A0 the actual firmware image bytes.
>> > +
>> > +``FILE`` (string)
>> > +=C2=A0=C2=A0=C2=A0 If the firmware binary is stored as a separate fil=
e, this tag contains the
>> > +=C2=A0=C2=A0=C2=A0 name of that file, assumed to be in the same direc=
tory as the TLV.
>> > +=C2=A0=C2=A0=C2=A0 This tag is always paired with ``SIZE``, so as to =
allow the driver to
>> > +=C2=A0=C2=A0=C2=A0 pre-allocate the buffer before loading the file.
>>=20
>> Note that `request_firmware` outrights reject paths that contain `..`.
>> These should probably be excluded from the allowed paths here as well.
>
> Ok.
>
> I guess that kills the idea of avoiding symlinks.

Pretty much. We could technically mangle the paths ourselves in the
kernel, but that's likely to be frowned upon.

>
>> We also need to specify what happens if we have a `FILE` tag but no
>> `SIZE` or vice-versa (presumably, this should be an error?).
>
> Technically, it's the caller that decides what to do in each case. =C2=A0=
There is no central "tag
> checker" that verifies any of this.  I felt that this document should be =
limited to describing
> how the tags work if you see one, rather than describing how to actually =
build a "proper" TLV
> file.  No one is expected to build the TLVs outside of the extract_firmwa=
re_nova.py script.

Since this is a file format specification, I'd argue it should on the
contrary try to pin down what is a valid TLV file and what is not.
Essentially so we can rely on it to make changes that have
backward-compatibility implications in the future.

>
> So to answer your question, if there's no SIZE tag, then it will need to =
use request_firmware()
> instead of request_firmware_into_buf().  I can add language that says tha=
t the SIZE tag should
> be created if it's at all possible to know the size when the TLV is built=
.

Yes, I think that would remove all ambiguity.

>
> I don't really have a strong opinion either way.
>
>> Another thing I think we should also formally specify: how are duplicate
>> tags handled?
>
> Well, currently the code will ignore the second copy of the tag, since th=
e iterator always
> starts from the beginning.  I'll add some text that says duplicates are n=
ot allowed, but if they
> exist, only the first tag (in offset order) is used, and the others are i=
gnored.

Sounds good to me.

>
>
>>=20
>> > +
>> > +GSP Firmware Tags
>> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> > +Used when loading the GSP (GPU System Processor) firmware
>> > +(``gsp.bin``).
>>=20
>> Do you mean `gsp.tlv`? (same for other files).
>
> Hmmm.... I don't think so.  But it's obviously so unclear I should remove=
 it.  I think the point
> I was trying to make is that this is the TLV that goes with gsp.bin.

I guess I was confused because `gsp.tlv` could technically point to a
different file through its `FILE` tag. The real anchor for the driver is
`gsp.tlv`.

<...>
>> > diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core=
/firmware.rs
>> > index 2749c196416d..888a426b7b41 100644
>> > --- a/drivers/gpu/nova-core/firmware.rs
>> > +++ b/drivers/gpu/nova-core/firmware.rs
>>=20
>> Since the code for `Tlv` seems to be nicely self-contained, can you put
>> it into a sub-module (`firmware/tlv.rs`)? This will reduce the amount of
>> stuff in `firmware.rs` too.
>
> Ok.
>
> I was also thinking of merging request_tlv() into the Tlv::new() construc=
tor.  Do you think
> that's a good idea?  We always precede Tlv::new() with request_tlv() anyw=
ay. =20

I like the `request` wording because it implies more strongly that we
are loading something. Maybe a `Tlv::request` constructor?

Having `Tlv::new` take an array of bytes looks natural and separates
parsing from loading. It also enables things like nested TLV files
should we ever need that.

>
>> > @@ -11,7 +11,7 @@
>> > =C2=A0=C2=A0=C2=A0=C2=A0 device,
>> > =C2=A0=C2=A0=C2=A0=C2=A0 firmware,
>> > =C2=A0=C2=A0=C2=A0=C2=A0 prelude::*,
>> > -=C2=A0=C2=A0=C2=A0 str::CString,
>> > +=C2=A0=C2=A0=C2=A0 str::{CStr, CString},
>> > =C2=A0=C2=A0=C2=A0=C2=A0 transmute::FromBytes, //
>> > =C2=A0};
>> > =C2=A0
>> > @@ -684,3 +684,240 @@ pub(super) fn elf_section<'a>(elf: &'a [u8], nam=
e: &str) -> Option<&'a
>> > [u8]> {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > =C2=A0=C2=A0=C2=A0=C2=A0 }
>> > =C2=A0}
>> > +
>> > +pub(crate) struct TlvBlock<'a> {
>>=20
>> `TlvBlock` and its members can be private IIUC.
>
> Ok
>
>>=20
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) tag: &'a str,
>>=20
>> This should probably be a `&'a [u8; 4]`? `str` is variable length and
>> technically UTF-8, using a 4-bytes array is the more accurate type.
>> Doing this also simplifies `parse` a bit.
>>=20
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) value: &'a [u8],
>> > +}
>> > +
>> > +/// On-wire TLV block header: 4-byte ASCII tag + little-endian payloa=
d length (bytes,
>> > excluding
>> > +/// padding to a 4-byte boundary).
>> > +struct TlvBlockHeader<'a> {
>> > +=C2=A0=C2=A0=C2=A0 tag: &'a str,
>>=20
>> Same here.
>
> I made these as strings to simplify the iterator so that it can just comp=
are strings, but I will
> take another look at the code.

Comparison of `[u8; 4]`s should be equally trivial to perform.

<...>
>> > +///
>> > +/// # Invariants
>> > +///
>> > +/// `pos` is a byte offset into `tlv.data` that always lies on a bloc=
k boundary (in the
>> > sense
>> > +/// of the [`Tlv`] invariant): it is either the start of a well-forme=
d block, or equal to
>> > +/// `tlv.data.len()` (end of iteration).
>> > +struct TlvIter<'tlv, 'a> {
>> > +=C2=A0=C2=A0=C2=A0 tlv: &'tlv Tlv<'a>,
>> > +=C2=A0=C2=A0=C2=A0 pos: usize,
>> > +}
>> > +
>> > +impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
>> > +=C2=A0=C2=A0=C2=A0 type Item =3D TlvBlock<'a>;
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Returns the block starting at `self.pos` and a=
dvances the cursor past it, or
>> > [`None`]
>> > +=C2=A0=C2=A0=C2=A0 /// once the cursor reaches the end of the data.
>> > +=C2=A0=C2=A0=C2=A0 ///
>> > +=C2=A0=C2=A0=C2=A0 /// The body relies on a number of `unsafe` operat=
ions, because [`Iterator::next`] can
>> > +=C2=A0=C2=A0=C2=A0 /// only return [`Option`], not [`Result`], so the=
re is no way to report a parse error
>> > +=C2=A0=C2=A0=C2=A0 /// from here.=C2=A0 That is why the entire TLV st=
ream is validated up front in the
>> > +=C2=A0=C2=A0=C2=A0 /// constructor.=C2=A0 By this type's invariants, =
`self.pos` is always on a block boundary
>> > +=C2=A0=C2=A0=C2=A0 /// into already-validated data, so each block is =
known to be well-formed, and
>> > +=C2=A0=C2=A0=C2=A0 /// therefore the unchecked operations cannot fail=
.
>>=20
>> Second paragraph also leaks implementation details and is not relevant
>> to users.
>
> Ok.  I like to add these kinds of comments, because I figure that if it w=
as hard for me to
> figure out, then others would probably appreciate it.  I wish the Nouveau=
 code had been
> documented like that.

It's fine to turn these into regular code comments if you think they are
useful (although in this case it looks like we are heading towards
removing the unsafe statements anyway). It's just that they don't bring
information that users will find directly useful and would justify them
being doccomments.

>
>> > +=C2=A0=C2=A0=C2=A0 fn next(&mut self) -> Option<Self::Item> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if self.pos >=3D self.tlv.=
data.len() {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn None;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tail =3D &self.tlv.dat=
a[self.pos..];
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `self.pos` is o=
n a block boundary (`TlvIter` invariant) and the check
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // above gives `self.pos <=
 data.len()`, so by the `Tlv` invariant a complete
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // well-formed block start=
s at `tail`.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let hdr =3D unsafe { tail.=
get_unchecked(..TlvBlockHeader::SIZE) };
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: same header byt=
es as validated in `Tlv::new` for this offset.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let header =3D unsafe { Tl=
vBlockHeader::parse(hdr).unwrap_unchecked() };
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let stored_size =3D header=
.length.next_multiple_of(4);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let advance =3D TlvBlockHe=
ader::SIZE + stored_size;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let payload_end =3D TlvBlo=
ckHeader::SIZE + header.length;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `advance` and `=
payload_end` are exactly the stored and logical payload
>> > extents
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `Tlv::new` accepted for=
 this block.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let value =3D unsafe {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
t block =3D tail.get_unchecked(..advance);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bl=
ock.get_unchecked(TlvBlockHeader::SIZE..payload_end)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>=20
>> As Danilo mentioned we should get rid of these `unsafe` blocks. I think
>> returning `None` if an error is met is fine: an error is, technically,
>> the end of the iteration; and we have validated the whole file in the
>> constructor, so they won't happen anyway.
>
> Ok.  I really don't like conflating Option with Result, though.  I figure=
d in this case, it
> would be better to eliminate any validation code that will never execute,=
 but no one seems to
> mind so I'll change it.  I'll just add a comment that technically this it=
erator will return None
> on errors that won't never actually occur because the TLV is validated.

Yeah, it's a tradeoff really. Ideally we would be able to represent the
validation done by the constructor using the type system and rely on
that to make the iterator safe and infallible. Here it looks like we
cannot, so the options are doing redundant error handling, panicking, or
unsafe code.

Unsafe code looks out of place in a parser that is not in any critical
path. I am not a fan of panicking either as it adds a landmine just
because nobody is ever supposed to step there and makes it harder to
prove that the code is indeed safe. This leaves error handling as the
least bad of the 3 options.

But since meeting these errors would technically be a bug in the code,
we can at least log them using `pr_err!` so they don't go unnoticed.

<...>
>> > +#[allow(dead_code)]
>> > +impl<'a> Tlv<'a> {
>> > +=C2=A0=C2=A0=C2=A0 const MAGIC: &'static [u8; 4] =3D b"NVFW";
>> > +
>> > +=C2=A0=C2=A0=C2=A0 /// Parses `data` as a TLV firmware image, returni=
ng [`EINVAL`] if the image is
>> > malformed.
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn new(data: &'a [u8]) -> Result<Self> =
{
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Verify that the magic b=
ytes exist and are the correct value
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let magic_len =3D Self::MA=
GIC.len();
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if data
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .g=
et(..magic_len)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .i=
s_none_or(|magic| magic !=3D Self::MAGIC)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn Err(EINVAL);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The payload is the cont=
iguous sequence of TLV blocks after the magic.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let payload =3D data.get(m=
agic_len..).ok_or(EINVAL)?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut pos =3D 0usize;
>>=20
>> You can work directly with `payload` and avoid storing the position in
>> its own variable. Just make `payload`'s declaration above `mut`, and
>> then:
>>=20
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while pos < payload.len() =
{
>>=20
>> =C2=A0=C2=A0=C2=A0 while !payload.is_empty() {
>>=20
>
> Ok.  I thought it would be safer to make an integer mut instead of a slic=
e.

The slice should be the safer option as it has less state to keep track
of.

Note that the `mut` keyword applies to the slice itself, not what it
points to - you still cannot modify the content of `payload`, you can
just assign a different slice to the `payload` variable.

>
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=
 Get the next TLV block.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
t Some(rest) =3D payload.get(pos..) else {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return Err(EINVAL);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>=20
>> This can disappear.
>
> Ok
>
>>=20
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=
 Validate and extract the header (type, length).
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
t Some(header) =3D rest
>>=20
>> s/rest/payload
>
> Only if I make payload mut as you suggest, right?

Oh yes these comments are still about dropping `pos`.

<...>
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tlv =3D self.iter().fi=
nd(|b| b.tag =3D=3D tag).ok_or(EINVAL)?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(tlv.value)
>>=20
>> nit: can be collapsed into=20
>>=20
>> =C2=A0=C2=A0 self.iter().find(|b| b.tag =3D=3D tag).map(|b| b.value).ok_=
or(EINVAL)
>
> I mean, yes it can be, but I don't see how that's an improvement.  That f=
irst line
>
> 	let tlv =3D self.iter().find(|b| b.tag =3D=3D tag).ok_or(EINVAL)?;
>
> exists in each getter, for consistency.  So I can only "collapse it" in g=
et_bytes, not in any of
> the others.

You can also chain more `map` and other operators. This gives a
functional vibe to the method which feels slightly more idiomatic in
Rust, but it is not critical if you prefer to keep it procedural. Both
read fine for something that short.

>
>
>
>>=20
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn get_u32(&self, tag: &str) -> Result<=
u32> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tlv =3D self.iter().fi=
nd(|b| b.tag =3D=3D tag).ok_or(EINVAL)?;
>>=20
>> You can reuse `get_bytes` to avoid repeating this snippet (also applies
>> to the other `get_` methods).
>
> I would rather have a private "find_tlv" method, so that all the getters =
are independent.

That would work as well.

>
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tlv.value
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .t=
ry_into()
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .o=
k()
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .m=
ap(u32::from_le_bytes)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .o=
k_or(EINVAL)
>> > +=C2=A0=C2=A0=C2=A0 }
>> > +
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn get_string(&self, tag: &str) -> Resu=
lt<&'a str> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tlv =3D self.iter().fi=
nd(|b| b.tag =3D=3D tag).ok_or(EINVAL)?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Handle the possibility =
that the value is null-terminated.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let bytes =3D match CStr::=
from_bytes_until_nul(tlv.value) {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok=
(cstr) =3D> cstr.to_bytes(),
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Er=
r(_) =3D> tlv.value,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>>=20
>> The spec says that strings are expected to be ASCII without a NULL
>> terminator - and the NULL terminator does not carry any meaning in Rust.
>> So I don't think we should be doing that check.
>
> Ok.  I thought I was being crafty here.
>
>
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // But do require it to be=
 all ASCII.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if !bytes.is_ascii() {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn Err(EINVAL);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> Btw, is it bad if we allow strings to be UTF-8?
>
> Depends on your definition of "bad" I guess.  printk doesn't have any rea=
l UTF-8 support, it
> just kinda works if you're careful.  I added this check because string ta=
gs are meant to be
> things like file names and version strings, and those things really shoul=
d not be UTF-8.  Multi-
> byte characters cause all sorts of problems.  We're not using TLV to stor=
e people's names.

Mmm indeed there is probably no real benefit here.
