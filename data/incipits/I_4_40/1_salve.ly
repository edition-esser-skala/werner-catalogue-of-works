\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    r4 r8 d'16(\p es) es8( d) r d16( es)
    es8( d) r4 r8 d\f b'4~
    b16 b a g a4\trill b r8 f\p
    g,4~ g16 a b c a8 f r c'16( d)
    d8( c) r c16( d) d8( c) r4
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    r4 r8 b'16(\p c) c8( b) r b16( c)
    c8( b) r4 r r8 f!\f
    c'4~ c16 c d es d8 b r a\p
    d \tuplet 3/2 8 { b16 c d } e,8.\trill f16 f4 r8 a16( b)
    b8( a) r a16( b) b8( a) r4
    R1
  }
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Largo" \autoBeamOff
    g'8[^\solo b16 a] g4. b16[ a] g4~
    g8[ b16 a] g8 d b g r4
    r2 r8 b f'4~
    f8 e16[ d] \hA e4 f8 a16[ g] f4~
    f8[ a16 g] f4. a16[ g] f[ g a f]
    b8 c16[ d] es4 d8 b g c
  }
}

BassoLyrics = \lyricmode {
  Sal -- _ _ _
  ve Re -- gi -- na,
  Re -- gi --
  na sal -- ve, sal -- _
  _ _ _
  _ ve, ma -- ter mi -- se -- "ri -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    g'4-\solo r8 g g4 r8 g
    g4. d8 b g g' d
    es c f! f, b4 a8 d
    b g c c, f4 r8 f'
    f4 r8 f f4. es!8
    d b g a b4 es
  }
}

BassFigures = \figuremode {
  r2 <6 4>8 <5 3>4.
  <6 4>8 <5 3>4 <_+>8 r4. <6>8
  <6 5>2. r4
  <6 5> <_!>2.
  <6 4>8 <5 3>4. <6 4>8 <5 3>4.
  r4 <6->2 <5>8 <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
