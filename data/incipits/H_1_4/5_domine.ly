\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    r8 g'' g g16 g g g g g g8 c
    h h h a16 gis c8 h a a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    R1*3
    r4 d'8 d e16 e d d c8 e
    d d e16 e e e e8 e16 e d4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r2 r4 a'8^\solo d
    d d16 c h8 a16 g fis8 g g[ fis]
    g4 d'8^\tutti d e16 e d d c8 e
    d d e16 e e e e8 e16 e d4
  }
}

SopranoLyrics = \lyricmode {
  et fu --
  ni -- cu -- lum me -- um in -- ve -- sti -- ga --
  sti, Ec -- ce, Do -- mi -- ne, tu co -- gno --
  vi -- sti o -- mni -- a, no -- vis -- si -- ma et
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    c8.^\solo d16 e[ f] g8 f8. g16 e8 a
    h c f,8. f16 e4 r
    r r8 e d d16 e d4
    d r8 g16^\tutti g g g g g g8 g
    g g e e e4 r8 a
  }
}

AltoLyrics = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti me, et
  co -- gno -- vi -- sti me,
  et se -- mi -- tam me --
  am Tu for -- ma -- sti me, et po -- su --
  i -- sti su -- per me "ma -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r8 c^\solo c h c e d16 e d c
    h8 h16 c d d c h a8 h16[ c] a8 a16 a^\tutti
    h8 h16 h g g h h c8 h16 h g8 c16 c
    h8 h16 h h[ c] a[ h] c8 h16 h a8 f'
  }
}

TenoreLyrics = \lyricmode {
  tu co -- gno -- vi -- sti ses -- si -- o -- nem
  me -- am et re -- sur -- re -- cti -- o -- nem me -- am. Mi --
  ra -- bi -- lis fa -- cta est sci -- en -- ti -- a tu -- a ex
  me, con -- for -- ta -- ta est, et non po -- "te -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    r4 r8 g'^\solo c, c' f, f
    g g,16[ a] h h c c d8 g16 g d4
    g,8 g'^\tutti h g c16 c g g e8 c
    g' g gis fis16 e a8 r f e16 d
  }
}

BassoLyrics = \lyricmode {
  In -- tel -- le -- xi -- sti
  co -- gi -- ta -- ti -- o -- nes me -- as de lon --
  ge, et o -- mnes vi -- as me -- as prae -- vi --
  di -- sti, qui -- a non est ser -- mo in
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    c8-\solo c'4 h8 a h c f,~
    f e d g c, c' f,4
    g8 g,16 a h8 c d g, d' d,
    g g'-\tutti h g c g e c
    g g' gis fis16 e a8 g f e16 d
  }
}

BassFigures = \figuremode {
  r2 <6>4. <3>8
  <4> <6> <7> q4. <6>4
  r2 <_+>4 <4>8 <_+>
  r1
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
